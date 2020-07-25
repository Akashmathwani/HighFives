import 'package:ansicolor/ansicolor.dart';

final a =
    " __    __   __    _______  __    __   _______  __  ____    ____  _______       _______.";
final b =
    "|  |  |  | |  |  /  _____||  |  |  | |   ____||  | \\   \\  /   / |   ____|    /       |";
final c =
    "|  |__|  | |  | |  |  __  |  |__|  | |  |__   |  |  \\   \\/   /  |  |__      |   (----`";
final d =
    "|   __   | |  | |  | |_ | |   __   | |   __|  |  |   \\      /   |   __|      |   |    ";
final e =
    "|  |  |  | |  | |  |__| | |  |  |  | |  |     |  |    \\    /    |  |____ .----)   |   ";
final f =
    "|__|  |__| |__|  \\______| |__|  |__| |__|     |__|     \\__/     |_______||_______/ ";

AnsiPen greenPen = AnsiPen()..green();
AnsiPen redPen = AnsiPen()..red();

final HIGHFIVES_BANNER = greenPen(a) +
    "\n" +
    greenPen(b) +
    "\n" +
    greenPen(c) +
    "\n" +
    greenPen(d) +
    "\n" +
    greenPen(e) +
    "\n" +
    greenPen(f);
