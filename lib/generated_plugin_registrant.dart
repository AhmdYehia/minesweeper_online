//
// Generated file. Do not edit.
//
import 'dart:ui';

import 'package:flutter_audioplayers_web/audioplayers_web.dart';
import 'package:flutter_context_menu_web/context_menu_plugin.dart';

import 'package:flutter_web_plugins/flutter_web_plugins.dart';

void registerPlugins(PluginRegistry registry) {
  AudioplayersPlugin.registerWith(registry.registrarFor(AudioplayersPlugin));
  ContextMenuPlugin.registerWith(registry.registrarFor(ContextMenuPlugin));
  registry.registerMessageHandler();
}
