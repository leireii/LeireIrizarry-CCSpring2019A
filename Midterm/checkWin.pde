boolean checkWin(boolean right[], boolean user[]){
  boolean correct[] = right;
  boolean player[] = user;
  boolean isDone = true;
  
  for (int i = 0; i < 16; i++){
    if (correct[i] != player[i]){
      isDone = false;
    }
  }
  return isDone;
}
