/*
Author: Leire Irizarry
Logo.PNG file is included in with files, but had to be hosted online and linked to.
In order to comply with browser Audio Context rules, code from https://p5js.org/reference/#/p5.sound/getAudioContext was used and will be further marked below.
This is HIT THE NOTE, a game where you have to repeat the note that the game plays at you in order to get points.
Summary:
Click to start. The game shows you a note and plays it. Hit SPACE to stop the sound and start singing.
If you don't hit the note, the circle will fade away and eventually die, costing you a heart. If you sing the right note,
the opacity will increase. Full opacity means you made it!

                                                        

                                                        IMPORTANT NOTE!
                                The audio input thresholds for this were made by me according to my computer's microphone.
                                For these settings, I would suggest being close to the computer/microphone and being loud.
                                If you would like to change or explore the threshold settings, go to line 175 and change the
                                200 to another number from 0 to 255, or lowest threshold to highest threshold. Setting it
                                higher would make it less sensitive to notes.

*/

// global variables
var mic;
var fft;
var framesfft; // result of fft.analyze();
var randomletter; // random variable
var randomfreq; // random variable
var yournote = ""; 
var logo;
var challenge; // THIS WILL BE THE OBJECT
// number-keeping systems, reset in setup()
var hearts;
var points;
// booleans
var isGameOver;
var isStart;
var canSing = false;

// MUSIC NOTE STUFF
const letterlist = ["C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B"];
const notes = {
    "C": [261.625],
    "C#": [277.1826],
    "D": [293.6648],
    "D#": [311.1270],
    "E": [329.6276],
    "F": [349.2282],
    "F#": [184.9972, 369.9944],
    "G": [195.9977, 391.9954],
    "G#": [207.6523],
    "A": [220, 440],
    "A#": [233.0819, 466.1638],
    "B": [246.9417, 493.8833]
}

function preload(){
    logo = loadImage('https://i.ibb.co/9y0msk7/logo.png');
}

function setup(){
    createCanvas(windowWidth, windowHeight);
    background(0);
    points = 0;
	// reset these variables for when you restart
    isGameOver = false;
    isStart = false;
    hearts = 3;
	
	// just some text settings
    textAlign(CENTER);
    textFont('Helvetica');
    textStyle(BOLD);
	
    // set up initial random letter but with a NOT random letter...
    // i'm using middle C as the first note intentionally. Middle C is
    // often a baseline note in music, especially in vocal music theory
    randomletter = letterlist[0];
    randomfreq = notes[randomletter][0];
    

    // set up microphone and fft
    mic = new p5.AudioIn();
    mic.start();
    fft = new p5.FFT();
    fft.setInput(mic);
	
	// create initial challenge
    challenge = new Challenge(randomletter, randomfreq);
    challenge.play();

}

function draw(){
    background(255);
    fill(255, 178, 210);
    textSize(50);
    // get audio context because Chrome required it...
	// credit for lines 89,91,92,94: https://p5js.org/reference/#/p5.sound/getAudioContext
    if (getAudioContext().state !== 'running') {
        homeScreen();        
    }else{
        if (!isStart){ // set up homescreen if not started
            homeScreen();
        }else{
            framesfft = fft.analyze();
            findnote(); // changes global variable yournote
            challenge.show();
            console.log(yournote);
            showHearts();
        
            // IF YOU STOPPED THE REFERENCE, YOU CAN NOW SING
            if (canSing){
        
                if (challenge.opacity <= 0){
                    hearts -= 1;
                    if (hearts > 0){
                        randomize();
                    }else{
                        challenge.stop();
                        gameOver();
                    }
                }
    
                if (challenge.opacity >= 255){
                    points += 15;
                    randomletter = random(letterlist);
                    randomfreq = notes[randomletter];
                    challenge = new Challenge(randomletter, random(randomfreq));
                    challenge.play();
                    challenge.show();
                }
        
                if (yournote == randomletter){
                    challenge.opacity += 2.5;
                }else{
                    challenge.opacity -= 1;
                }
            }
        
        }

        }


    
}


// FUNCTIONS //

function mouseClicked(){
    isStart = true;
}

function showHearts(){
	// draw 'hearts' (actually more like 'orbs')
    fill(255, 178, 210);
    for (let i = 0; i < hearts; i++){
        circle(50 * (i+1), 50, 25);
    }
	
	// conveniently put other UI stuff such as the points count and the logo on the top right
    logo.resize(350, 100);
    image(logo, windowWidth - 150, 50);
    textStyle(BOLD);
    textSize(20);
    text("POINTS: " + str(points), 100, windowHeight - 50);
}

function findnote(){
    var playednotes = [];
    for (var letter in notes){
        // NOTE: LETTER IS THE CHARACTER! EXAMPLE: "C"
        var notefrequencies = notes[letter]; // list of FREQUENCIES in "C"
        
        for (let i = 0; i < notefrequencies.length; i++){ // i IS EACH FREQUENCY
            if(fft.getEnergy(notefrequencies[i]) > 200){
                playednotes.push(letter);
            }
        }
    }

	// set a counter so that you can slim the list and find your note
    var counter = 1;
    var temp = playednotes[0];
    var actualnote = "X";
    for (let i = 0; i < playednotes.length; i++){

        if (i > 0){
            if (playednotes[i] == temp){
                counter += 1;
        }else{
            if (counter >= 1){
                actualnote = temp;
            }
            temp = playednotes[i];
            counter = 1;
          }
        }
    
    }
    if (playednotes.length == 1){
            actualnote = playednotes[0];
    }
    console.log("ALL NOTES", playednotes);
	// change the global variable 
    if (actualnote != "X"){
        yournote = actualnote;
    }else{
        yournote = "";
    }

    console.log('ACTUALNOTE: ' + actualnote);
}

function randomize(){
    randomletter = random(letterlist);
    randomfreq = notes[randomletter];
    challenge = new Challenge(randomletter, random(randomfreq));
    challenge.play();
    challenge.show();
}

function keyPressed() {
    if (key == " "){
        challenge.stop();
        if (isGameOver){
            isGameOver = false;
            clear();
            setup();
        }
    }
}

// credit for function touchStarted(): https://p5js.org/reference/#/p5.sound/getAudioContext
function touchStarted() {
    if (getAudioContext().state !== 'running') {
      getAudioContext().resume();
    }
}

function homeScreen(){
    imageMode(CENTER);
    logo.resize(880, 230);
    image(logo, windowWidth/2, windowHeight/2 - 50);
    textSize(50);
    text("CLICK TO BEGIN", width/2, height/4 * 3 - 50);
    textSize(30);
    text("Press SPACE to stop hearing the reference note and start singing.", windowWidth/2, height/4 * 3);
    text("Try to match the notes!", width/2, height/4 * 3 + 50);      
}

function gameOver(){
    clear();
    textSize(60);
    fill(255, 178, 210);
    text("GAME OVER", windowWidth/2, windowHeight/4);
    text("SCORE:", windowWidth/2, windowHeight/2);
    text("PRESS SPACE TO PLAY AGAIN", windowWidth/2, windowHeight - 50);
    textSize(70);
    text(points, windowWidth/2, 3*windowHeight/4);
    isGameOver = true;
}

class Challenge{

    
    constructor(letter, frequency, opacity = 125){
        canSing = false;
        this.letter = letter;
        this.frequency = frequency;
        this.opacity = opacity;
        this.reference = new p5.Oscillator();
        this.reference.freq(this.frequency);
        this.r = random(255);
        this.g = random(255);
        this.b = random(255);
    }
	// play the reference note
    play(){
        this.reference.amp(1.5);
        this.reference.start();
    }
	// stop the reference note
    stop(){
        this.reference.stop();
        canSing = true;
    }
	// draw the circle and text
    show(){
        noStroke();
        fill(this.r, this.g, this.b, this.opacity);
        circle(windowWidth/2, windowHeight/2, 300);
        fill(255);
        textAlign(CENTER);
        textSize(200);
        text(this.letter, windowWidth/2, windowHeight/2 + 60);
    }
}

