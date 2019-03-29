boolean checkMatch(boolean right[], boolean user[], int num){
  boolean correct[] = right;
  boolean player[] = user;
  int count = num;

  if (correct[count] == player[count]){
    return true;
  }else{
    return false;
  }
}
