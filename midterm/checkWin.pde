boolean checkWin(boolean right[], boolean user[]){
  boolean correct[] = right;
  boolean player[] = user;
  boolean isDone = true;
  
  // check to see if the player messed up
  for (int i = 0; i < 16; i++){
    if (correct[i] != player[i]){
      isDone = false;
    }
  }
  return isDone;
}
