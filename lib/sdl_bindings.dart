import 'dart:ffi' as ffi;
import 'dart:io';

// FFI type definitions for the C functions
typedef c_create_window_func =
    ffi.Uint8 Function(ffi.Int32, ffi.Int32, ffi.Pointer<ffi.Int8>);
typedef DartCreateWindow = int Function(int, int, ffi.Pointer<ffi.Int8>);

typedef c_draw_rect_func =
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

typedef c_poll_window_func = ffi.Uint8 Function();
typedef DartPollWindow = int Function();

typedef c_destroy_window_func = ffi.Void Function();
typedef DartDestroyWindow = void Function();

final dylib = ffi.DynamicLibrary.open(
  Platform.isLinux
      ? 'native/libsdl_utils.so'
      : Platform.isMacOS
      ? 'native/libsdl_utils.dylib'
      : 'native/sdl_utils.dll',
);

final DartCreateWindow createWindow =
    dylib
        .lookup<ffi.NativeFunction<c_create_window_func>>('create_window')
        .asFunction();
final DartDrawRect drawRect =
    dylib
        .lookup<ffi.NativeFunction<c_draw_rect_func>>('draw_rect')
        .asFunction();
final DartPollWindow pollWindow =
    dylib
        .lookup<ffi.NativeFunction<c_poll_window_func>>('poll_window')
        .asFunction();
final DartDestroyWindow destroyWindow =
    dylib
        .lookup<ffi.NativeFunction<c_destroy_window_func>>('destroy_window')
        .asFunction();
