class Rain {
  Rain({
    required this.h3,
  });

  num h3;

  factory Rain.fromJson(Map<String, dynamic> json) => Rain(
        h3: json["3h"],
      );

  Map<String, dynamic>? toJson() => {
        "3h": h3,
      };
}
