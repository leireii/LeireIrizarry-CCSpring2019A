boolean checkMatch(boolean right[], boolean user[], int num){
  boolean correct[] = right;
  boolean player[] = user;
  int count = num;

  // check to see if every value in correct matches its respective place in player
  if (correct[count] == player[count]){
    return true;
  }else{
    return false;
  }
}
