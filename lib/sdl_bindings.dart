import 'dart:ffi' as ffi;
import 'package:ffi/ffi.dart';
import 'dart:io';

// FFI type definitions for the C functions
typedef CCreateWindowFunc =
    ffi.Uint8 Function(ffi.Int32, ffi.Int32, ffi.Pointer<ffi.Int8>);
typedef DartCreateWindow = int Function(int, int, ffi.Pointer<ffi.Int8>);

typedef CDrawRectFunc =
    ffi.Void Function(
      ffi.Int32,
      ffi.Int32,
      ffi.Int32,
      ffi.Int32,
      ffi.Uint8,
      ffi.Uint8,
      ffi.Uint8,
      ffi.Uint8,
    );
typedef DartDrawRect = void Function(int, int, int, int, int, int, int, int);

typedef CPollWindowFunc = ffi.Uint8 Function();
typedef DartPollWindow = int Function();

typedef CDestroyWindowFunc = ffi.Void Function();
typedef DartDestroyWindow = void Function();

typedef CDrawTextFunc =
    ffi.Void Function(
      ffi.Pointer<ffi.Int8>,
      ffi.Int32,
      ffi.Int32,
      ffi.Uint8,
      ffi.Uint8,
      ffi.Uint8,
      ffi.Uint8,
    );
typedef DartDrawText =
    void Function(ffi.Pointer<ffi.Int8>, int, int, int, int, int, int);

typedef CGetLastKeyPressedFunc = ffi.Int32 Function();
typedef DartGetLastKeyPressed = int Function();

typedef CClearLastKeyPressedFunc = ffi.Void Function();
typedef DartClearLastKeyPressed = void Function();

// Add clear_screen binding

typedef CClearScreenFunc =
    ffi.Void Function(ffi.Uint8, ffi.Uint8, ffi.Uint8, ffi.Uint8);
typedef DartClearScreen = void Function(int, int, int, int);

typedef CPresentRendererFunc = ffi.Void Function();
typedef DartPresentRenderer = void Function();

typedef CDrawLineFunc =
    ffi.Void Function(
      ffi.Int32,
      ffi.Int32,
      ffi.Int32,
      ffi.Int32,
      ffi.Uint8,
      ffi.Uint8,
      ffi.Uint8,
      ffi.Uint8,
    );
typedef DartDrawLine = void Function(int, int, int, int, int, int, int, int);

typedef CMeasureTextWidthFunc = ffi.Int32 Function(ffi.Pointer<ffi.Int8>);
typedef DartMeasureTextWidth = int Function(ffi.Pointer<ffi.Int8>);

final dylib = ffi.DynamicLibrary.open(
  Platform.isLinux
      ? (File('./libsdl_utils.so').existsSync()
          ? './libsdl_utils.so'
          : 'native/libsdl_utils.so')
      : Platform.isMacOS
      ? (File('./libsdl_utils.dylib').existsSync()
          ? './libsdl_utils.dylib'
          : 'native/libsdl_utils.dylib')
      : (File('./sdl_utils.dll').existsSync()
          ? './sdl_utils.dll'
          : 'native/sdl_utils.dll'),
);

final DartCreateWindow createWindow =
    dylib
        .lookup<ffi.NativeFunction<CCreateWindowFunc>>('create_window')
        .asFunction();
final DartDrawRect drawRect =
    dylib.lookup<ffi.NativeFunction<CDrawRectFunc>>('draw_rect').asFunction();
final DartPollWindow pollWindow =
    dylib
        .lookup<ffi.NativeFunction<CPollWindowFunc>>('poll_window')
        .asFunction();
final DartDestroyWindow destroyWindow =
    dylib
        .lookup<ffi.NativeFunction<CDestroyWindowFunc>>('destroy_window')
        .asFunction();
final DartDrawText drawText =
    dylib.lookup<ffi.NativeFunction<CDrawTextFunc>>('draw_text').asFunction();
final DartGetLastKeyPressed getLastKeyPressed =
    dylib
        .lookup<ffi.NativeFunction<CGetLastKeyPressedFunc>>(
          "get_last_key_pressed",
        )
        .asFunction();
final DartClearLastKeyPressed clearLastKeyPressed =
    dylib
        .lookup<ffi.NativeFunction<CClearLastKeyPressedFunc>>(
          "clear_last_key_pressed",
        )
        .asFunction();
final DartClearScreen clearScreen =
    dylib
        .lookup<ffi.NativeFunction<CClearScreenFunc>>('clear_screen')
        .asFunction();
final DartPresentRenderer presentRenderer =
    dylib
        .lookup<ffi.NativeFunction<CPresentRendererFunc>>('present_renderer')
        .asFunction();
final DartDrawLine drawLine =
    dylib.lookup<ffi.NativeFunction<CDrawLineFunc>>('draw_line').asFunction();
final DartMeasureTextWidth measureTextWidth =
    dylib
        .lookup<ffi.NativeFunction<CMeasureTextWidthFunc>>('measure_text_width')
        .asFunction();

// Draw a filled rectangle with optional alpha (for overlays, boxes, etc.)
void drawBox(int x, int y, int w, int h, int r, int g, int b, int a) {
  drawRect(x, y, w, h, r, g, b, a);
}

// Draw a horizontal line (for underlines, separators)
void drawHLine(int x1, int x2, int y, int r, int g, int b, int a) {
  drawLine(x1, y, x2, y, r, g, b, a);
}

// Draw text centered horizontally
void drawTextCentered(
  String text,
  int y,
  int colorR,
  int colorG,
  int colorB,
  int colorA, {
  int width = 1280, // default to new window width
}) {
  final ptr = text.toNativeUtf8();
  int textWidth = measureTextWidth(ptr.cast<ffi.Int8>());
  int x = (width - textWidth) ~/ 2;
  drawText(ptr.cast<ffi.Int8>(), x, y, colorR, colorG, colorB, colorA);
  calloc.free(ptr);
}
