/*
Author: Leire Irizarry
Summary: Screams at you if microphone input reaches past a
certain threshold.
*/

// variables
var song;
var mic;
var yell;

// preload audio
function preload(){
  song = loadSound("BGM.mp3"); // minecraft theme song
  yell = loadSound("yell.mp3"); // yell
}

function setup(){
    createCanvas(700, 700);
    background(0);
    
    // set up mic
    mic = new p5.AudioIn();
    mic.start();

    // check audio context
    if (getAudioContext().state !== 'running') {
        text('Click to start recording', width/2, height/2);
      } else {
        text('Recording ON', width/2, height/2);
      }
    song.play();
    song.amp(1.5);

}

function draw(){
    background(0);    
    colorMode(HSB, 360, 100, 100);
    noStroke();
    // map the color and height of rectangle to the sound
    fill(map(mic.getLevel(), 0, 0.3, 0, 360), 100, 100);
    rect(0, 0, width, map(mic.getLevel(), 0, 0.2, 0, height));

    // plays the scream file
    if (mic.getLevel() > 0.06){
        yell.play();
    }

}

// check for audio context
function touchStarted() {
    if (getAudioContext().state !== 'running') {
      getAudioContext().resume();
    }
  }