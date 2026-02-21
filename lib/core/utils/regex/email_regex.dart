class EmailRegex {
  EmailRegex._();

  static RegExp emailRegex = RegExp(
    r"^(?=[a-zA-Z0-9@._%+-]{6,254}$)(?=.{1,64}@.{1,255}$)([a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,})$",
  );
}
