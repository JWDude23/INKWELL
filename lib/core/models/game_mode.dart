enum GameMode {

  /// One shared device passed between players.
  /// Uses the magical tome/page flip interface.
  book,


  /// Tablet sitting in the middle of the table.
  /// Players choose seats and the table perspective shifts.
  table,


  /// One player using their own phone.
  /// Shows their personal board and opponent information.
  personal,

}