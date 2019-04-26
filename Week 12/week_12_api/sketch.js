let input, orig, target, button;
let from = 'USD';
let to = 'EUR';
let amount;
var result;
var loaded = false;
var num;

function setup(){
  createCanvas(windowWidth, windowHeight);
  background(255, 208, 199);


  input = createInput();
  input.position(windowWidth/2 - 100, windowHeight/2);

  orig = createInput();
  orig.position(windowWidth/3 - 100, windowHeight/3);

  target = createInput();
  target.position(windowWidth*2/3 - 100, windowHeight/3);

  button = createButton('Convert!');
  button.position(input.x + 50, input.y + 50);
  button.mousePressed(function() {
    from = orig.value();
    to = target.value();
    amount = input.value();
    url = 'http://data.fixer.io/api/latest?access_key=da502125f2b88ea45a0a33ee7f851c01'+'&from='+ from + '&to=' + to + '&amount=' + amount;
    result = httpGet(url, 'json', false, function(conversion){
      result = (amount * conversion.rates[to])/conversion.rates[from];
      num = result;
    }
    );
  });

}

function draw(){
  background(255, 208, 199);
  textSize(50);
  text(result, windowWidth/3 + 20, windowHeight - 250);
}
