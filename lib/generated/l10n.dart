// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Stardust Hub`
  String get ui_app_name {
    return Intl.message(
      'Stardust Hub',
      name: 'ui_app_name',
      desc: '',
      args: [],
    );
  }

  /// `multi-state design and control hub`
  String get app_description {
    return Intl.message(
      'multi-state design and control hub',
      name: 'app_description',
      desc: '',
      args: [],
    );
  }

  /// `Copyright © 2025 ZhaoShenWen. All Rights Reserved.`
  String get app_copyright {
    return Intl.message(
      'Copyright © 2025 ZhaoShenWen. All Rights Reserved.',
      name: 'app_copyright',
      desc: '',
      args: [],
    );
  }

  /// `Hami Lab`
  String get app_author {
    return Intl.message('Hami Lab', name: 'app_author', desc: '', args: []);
  }

  /// `Act to grace the world`
  String get app_author_desc {
    return Intl.message(
      'Act to grace the world',
      name: 'app_author_desc',
      desc: '',
      args: [],
    );
  }

  /// `hi@tineaine.cn`
  String get app_email {
    return Intl.message(
      'hi@tineaine.cn',
      name: 'app_email',
      desc: '',
      args: [],
    );
  }

  /// `Dark Mode`
  String get night_mode {
    return Intl.message('Dark Mode', name: 'night_mode', desc: '', args: []);
  }

  /// `Light Mode`
  String get light_mode {
    return Intl.message('Light Mode', name: 'light_mode', desc: '', args: []);
  }

  /// `license: Non-commercial`
  String get app_license {
    return Intl.message(
      'license: Non-commercial',
      name: 'app_license',
      desc: '',
      args: [],
    );
  }

  /// `Create Product`
  String get create_product {
    return Intl.message(
      'Create Product',
      name: 'create_product',
      desc: '',
      args: [],
    );
  }

  /// `Create Version`
  String get create_version {
    return Intl.message(
      'Create Version',
      name: 'create_version',
      desc: '',
      args: [],
    );
  }

  /// `Create Menu`
  String get create_profile {
    return Intl.message(
      'Create Menu',
      name: 'create_profile',
      desc: '',
      args: [],
    );
  }

  /// `Create Symbol`
  String get create_symbol {
    return Intl.message(
      'Create Symbol',
      name: 'create_symbol',
      desc: '',
      args: [],
    );
  }

  /// `Create Datasource`
  String get create_datasource {
    return Intl.message(
      'Create Datasource',
      name: 'create_datasource',
      desc: '',
      args: [],
    );
  }

  /// `Version Lib`
  String get version_manage {
    return Intl.message(
      'Version Lib',
      name: 'version_manage',
      desc: '',
      args: [],
    );
  }

  /// `Menu`
  String get profile {
    return Intl.message('Menu', name: 'profile', desc: '', args: []);
  }

  /// `Version`
  String get version_select {
    return Intl.message('Version', name: 'version_select', desc: '', args: []);
  }

  /// `Good thing i love you, My Emma.`
  String get say_hello {
    return Intl.message(
      'Good thing i love you, My Emma.',
      name: 'say_hello',
      desc: '',
      args: [],
    );
  }

  /// `Create`
  String get create {
    return Intl.message('Create', name: 'create', desc: '', args: []);
  }

  /// `Manage`
  String get manage {
    return Intl.message('Manage', name: 'manage', desc: '', args: []);
  }

  /// `Design`
  String get design {
    return Intl.message('Design', name: 'design', desc: '', args: []);
  }

  /// `No save`
  String get no_save {
    return Intl.message('No save', name: 'no_save', desc: '', args: []);
  }

  /// `No status`
  String get no_status {
    return Intl.message('No status', name: 'no_status', desc: '', args: []);
  }

  /// `No data`
  String get no_data {
    return Intl.message('No data', name: 'no_data', desc: '', args: []);
  }

  /// `Delete`
  String get delete {
    return Intl.message('Delete', name: 'delete', desc: '', args: []);
  }

  /// `Clone`
  String get clone {
    return Intl.message('Clone', name: 'clone', desc: '', args: []);
  }

  /// `Copy`
  String get copy {
    return Intl.message('Copy', name: 'copy', desc: '', args: []);
  }

  /// `Edit`
  String get edit {
    return Intl.message('Edit', name: 'edit', desc: '', args: []);
  }

  /// `Save`
  String get save {
    return Intl.message('Save', name: 'save', desc: '', args: []);
  }

  /// `Cancel`
  String get cancel {
    return Intl.message('Cancel', name: 'cancel', desc: '', args: []);
  }

  /// `Confirm`
  String get confirm {
    return Intl.message('Confirm', name: 'confirm', desc: '', args: []);
  }

  /// `Close`
  String get close {
    return Intl.message('Close', name: 'close', desc: '', args: []);
  }

  /// `Reflush`
  String get reflush {
    return Intl.message('Reflush', name: 'reflush', desc: '', args: []);
  }

  /// `Move Up`
  String get move_up {
    return Intl.message('Move Up', name: 'move_up', desc: '', args: []);
  }

  /// `Move Down`
  String get move_down {
    return Intl.message('Move Down', name: 'move_down', desc: '', args: []);
  }

  /// `Disable`
  String get disable {
    return Intl.message('Disable', name: 'disable', desc: '', args: []);
  }

  /// `Enable`
  String get enable {
    return Intl.message('Enable', name: 'enable', desc: '', args: []);
  }

  /// `Test`
  String get test {
    return Intl.message('Test', name: 'test', desc: '', args: []);
  }

  /// `Hello, What do you want to explore today?`
  String get hint_say_hello {
    return Intl.message(
      'Hello, What do you want to explore today?',
      name: 'hint_say_hello',
      desc: '',
      args: [],
    );
  }

  /// `Please select data`
  String get hint_select_comp_text {
    return Intl.message(
      'Please select data',
      name: 'hint_select_comp_text',
      desc: '',
      args: [],
    );
  }

  /// `Go Home`
  String get hint_back_button {
    return Intl.message(
      'Go Home',
      name: 'hint_back_button',
      desc: '',
      args: [],
    );
  }

  /// `Please Select Version`
  String get hint_select_version {
    return Intl.message(
      'Please Select Version',
      name: 'hint_select_version',
      desc: '',
      args: [],
    );
  }

  /// `There is an unsaved in the current designer, and the changes may be lost if the operation continues!`
  String get hint_no_save_sure_exit {
    return Intl.message(
      'There is an unsaved in the current designer, and the changes may be lost if the operation continues!',
      name: 'hint_no_save_sure_exit',
      desc: '',
      args: [],
    );
  }

  /// `Save successfully!`
  String get hint_save_success {
    return Intl.message(
      'Save successfully!',
      name: 'hint_save_success',
      desc: '',
      args: [],
    );
  }

  /// `Comp cannot find.`
  String get hint_comp_not_find {
    return Intl.message(
      'Comp cannot find.',
      name: 'hint_comp_not_find',
      desc: '',
      args: [],
    );
  }

  /// `Note: You will not be able to change the version number again after the version is created!`
  String get hint_create_version {
    return Intl.message(
      'Note: You will not be able to change the version number again after the version is created!',
      name: 'hint_create_version',
      desc: '',
      args: [],
    );
  }

  /// `This is a dangerous operation, please press and hold the button to confirm the operation`
  String get hint_danger_operator_warn {
    return Intl.message(
      'This is a dangerous operation, please press and hold the button to confirm the operation',
      name: 'hint_danger_operator_warn',
      desc: '',
      args: [],
    );
  }

  /// `Datasource`
  String get datasource {
    return Intl.message('Datasource', name: 'datasource', desc: '', args: []);
  }

  /// `Attr`
  String get attribute {
    return Intl.message('Attr', name: 'attribute', desc: '', args: []);
  }

  /// `AI`
  String get ai {
    return Intl.message('AI', name: 'ai', desc: '', args: []);
  }

  /// `Setting`
  String get setting {
    return Intl.message('Setting', name: 'setting', desc: '', args: []);
  }

  /// `Product Setting`
  String get setting_product {
    return Intl.message(
      'Product Setting',
      name: 'setting_product',
      desc: '',
      args: [],
    );
  }

  /// `push`
  String get push {
    return Intl.message('push', name: 'push', desc: '', args: []);
  }

  /// `pull`
  String get pull {
    return Intl.message('pull', name: 'pull', desc: '', args: []);
  }

  /// `Package`
  String get product_package {
    return Intl.message('Package', name: 'product_package', desc: '', args: []);
  }

  /// `About`
  String get about_us {
    return Intl.message('About', name: 'about_us', desc: '', args: []);
  }

  /// `Basic`
  String get basic {
    return Intl.message('Basic', name: 'basic', desc: '', args: []);
  }

  /// `Data`
  String get data {
    return Intl.message('Data', name: 'data', desc: '', args: []);
  }

  /// `Style`
  String get style {
    return Intl.message('Style', name: 'style', desc: '', args: []);
  }

  /// `Event`
  String get event {
    return Intl.message('Event', name: 'event', desc: '', args: []);
  }

  /// `ID`
  String get id {
    return Intl.message('ID', name: 'id', desc: '', args: []);
  }

  /// `Name`
  String get name {
    return Intl.message('Name', name: 'name', desc: '', args: []);
  }

  /// `Author`
  String get author {
    return Intl.message('Author', name: 'author', desc: '', args: []);
  }

  /// `Sort`
  String get sort {
    return Intl.message('Sort', name: 'sort', desc: '', args: []);
  }

  /// `Description`
  String get description {
    return Intl.message('Description', name: 'description', desc: '', args: []);
  }

  /// `Display`
  String get data_display {
    return Intl.message('Display', name: 'data_display', desc: '', args: []);
  }

  /// `No attr`
  String get no_attr {
    return Intl.message('No attr', name: 'no_attr', desc: '', args: []);
  }

  /// `Data Path`
  String get data_path {
    return Intl.message('Data Path', name: 'data_path', desc: '', args: []);
  }

  /// `Default`
  String get default_val {
    return Intl.message('Default', name: 'default_val', desc: '', args: []);
  }

  /// `Format`
  String get format {
    return Intl.message('Format', name: 'format', desc: '', args: []);
  }

  /// `Dynamic`
  String get dynamic {
    return Intl.message('Dynamic', name: 'dynamic', desc: '', args: []);
  }

  /// `Dynamic Init`
  String get dynamic_init {
    return Intl.message(
      'Dynamic Init',
      name: 'dynamic_init',
      desc: '',
      args: [],
    );
  }

  /// `No Open`
  String get no_open {
    return Intl.message('No Open', name: 'no_open', desc: '', args: []);
  }

  /// `Version ID`
  String get version_id {
    return Intl.message('Version ID', name: 'version_id', desc: '', args: []);
  }

  /// `Warn`
  String get warn {
    return Intl.message('Warn', name: 'warn', desc: '', args: []);
  }

  /// `Success`
  String get success {
    return Intl.message('Success', name: 'success', desc: '', args: []);
  }

  /// `Info`
  String get info {
    return Intl.message('Info', name: 'info', desc: '', args: []);
  }

  /// `Fail`
  String get error {
    return Intl.message('Fail', name: 'error', desc: '', args: []);
  }

  /// `Operator`
  String get operator {
    return Intl.message('Operator', name: 'operator', desc: '', args: []);
  }

  /// `Display`
  String get display {
    return Intl.message('Display', name: 'display', desc: '', args: []);
  }

  /// `Input`
  String get input {
    return Intl.message('Input', name: 'input', desc: '', args: []);
  }

  /// `Group`
  String get group {
    return Intl.message('Group', name: 'group', desc: '', args: []);
  }

  /// `Action`
  String get action {
    return Intl.message('Action', name: 'action', desc: '', args: []);
  }

  /// `Topic`
  String get symbol_topic {
    return Intl.message('Topic', name: 'symbol_topic', desc: '', args: []);
  }

  /// `Conspicuous description content`
  String get symbol_topic_desc {
    return Intl.message(
      'Conspicuous description content',
      name: 'symbol_topic_desc',
      desc: '',
      args: [],
    );
  }

  /// `Title`
  String get symbol_title {
    return Intl.message('Title', name: 'symbol_title', desc: '', args: []);
  }

  /// `Display paragraph title`
  String get symbol_title_desc {
    return Intl.message(
      'Display paragraph title',
      name: 'symbol_title_desc',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get symbol_desc {
    return Intl.message('Description', name: 'symbol_desc', desc: '', args: []);
  }

  /// `Display paragraph description`
  String get symbol_desc_desc {
    return Intl.message(
      'Display paragraph description',
      name: 'symbol_desc_desc',
      desc: '',
      args: [],
    );
  }

  /// `Log`
  String get symbol_log {
    return Intl.message('Log', name: 'symbol_log', desc: '', args: []);
  }

  /// `Display specific logs`
  String get symbol_log_desc {
    return Intl.message(
      'Display specific logs',
      name: 'symbol_log_desc',
      desc: '',
      args: [],
    );
  }

  /// `Text Input`
  String get symbol_text_input {
    return Intl.message(
      'Text Input',
      name: 'symbol_text_input',
      desc: '',
      args: [],
    );
  }

  /// `Display a text input box`
  String get symbol_text_input_desc {
    return Intl.message(
      'Display a text input box',
      name: 'symbol_text_input_desc',
      desc: '',
      args: [],
    );
  }

  /// `Selector`
  String get symbol_select {
    return Intl.message('Selector', name: 'symbol_select', desc: '', args: []);
  }

  /// `A drop-down selector`
  String get symbol_select_desc {
    return Intl.message(
      'A drop-down selector',
      name: 'symbol_select_desc',
      desc: '',
      args: [],
    );
  }

  /// `Switch`
  String get symbol_switch {
    return Intl.message('Switch', name: 'symbol_switch', desc: '', args: []);
  }

  /// `A component used to control boolean values`
  String get symbol_switch_desc {
    return Intl.message(
      'A component used to control boolean values',
      name: 'symbol_switch_desc',
      desc: '',
      args: [],
    );
  }

  /// `Button`
  String get symbol_button {
    return Intl.message('Button', name: 'symbol_button', desc: '', args: []);
  }

  /// `A button used to trigger actions`
  String get symbol_button_desc {
    return Intl.message(
      'A button used to trigger actions',
      name: 'symbol_button_desc',
      desc: '',
      args: [],
    );
  }

  /// `Image`
  String get symbol_image {
    return Intl.message('Image', name: 'symbol_image', desc: '', args: []);
  }

  /// `Display an image`
  String get symbol_image_desc {
    return Intl.message(
      'Display an image',
      name: 'symbol_image_desc',
      desc: '',
      args: [],
    );
  }

  /// `Divider`
  String get symbol_divider {
    return Intl.message('Divider', name: 'symbol_divider', desc: '', args: []);
  }

  /// `Used to divide page areas`
  String get symbol_divider_desc {
    return Intl.message(
      'Used to divide page areas',
      name: 'symbol_divider_desc',
      desc: '',
      args: [],
    );
  }

  /// `Markdown`
  String get symbol_markdown {
    return Intl.message(
      'Markdown',
      name: 'symbol_markdown',
      desc: '',
      args: [],
    );
  }

  /// `Markdown text`
  String get symbol_markdown_desc {
    return Intl.message(
      'Markdown text',
      name: 'symbol_markdown_desc',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'zh'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
