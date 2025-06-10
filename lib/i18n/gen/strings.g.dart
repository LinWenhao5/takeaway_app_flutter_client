/// Generated file. Do not edit.
///
/// Original: lib/i18n/translations
/// To regenerate, run: `dart run slang`
///
/// Locales: 2
/// Strings: 76 (38 per locale)
///
/// Built on 2025-06-10 at 14:35 UTC

// coverage:ignore-file
// ignore_for_file: type=lint

import 'package:flutter/widgets.dart';
import 'package:slang/builder/model/node.dart';
import 'package:slang_flutter/slang_flutter.dart';
export 'package:slang_flutter/slang_flutter.dart';

const AppLocale _baseLocale = AppLocale.en;

/// Supported locales, see extension methods below.
///
/// Usage:
/// - LocaleSettings.setLocale(AppLocale.en) // set locale
/// - Locale locale = AppLocale.en.flutterLocale // get flutter locale from enum
/// - if (LocaleSettings.currentLocale == AppLocale.en) // locale check
enum AppLocale with BaseAppLocale<AppLocale, Translations> {
	en(languageCode: 'en', build: Translations.build),
	nl(languageCode: 'nl', build: _StringsNl.build);

	const AppLocale({required this.languageCode, this.scriptCode, this.countryCode, required this.build}); // ignore: unused_element

	@override final String languageCode;
	@override final String? scriptCode;
	@override final String? countryCode;
	@override final TranslationBuilder<AppLocale, Translations> build;

	/// Gets current instance managed by [LocaleSettings].
	Translations get translations => LocaleSettings.instance.translationMap[this]!;
}

/// Method A: Simple
///
/// No rebuild after locale change.
/// Translation happens during initialization of the widget (call of t).
/// Configurable via 'translate_var'.
///
/// Usage:
/// String a = t.someKey.anotherKey;
/// String b = t['someKey.anotherKey']; // Only for edge cases!
Translations get t => LocaleSettings.instance.currentTranslations;

/// Method B: Advanced
///
/// All widgets using this method will trigger a rebuild when locale changes.
/// Use this if you have e.g. a settings page where the user can select the locale during runtime.
///
/// Step 1:
/// wrap your App with
/// TranslationProvider(
/// 	child: MyApp()
/// );
///
/// Step 2:
/// final t = Translations.of(context); // Get t variable.
/// String a = t.someKey.anotherKey; // Use t variable.
/// String b = t['someKey.anotherKey']; // Only for edge cases!
class TranslationProvider extends BaseTranslationProvider<AppLocale, Translations> {
	TranslationProvider({required super.child}) : super(settings: LocaleSettings.instance);

	static InheritedLocaleData<AppLocale, Translations> of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context);
}

/// Method B shorthand via [BuildContext] extension method.
/// Configurable via 'translate_var'.
///
/// Usage (e.g. in a widget's build method):
/// context.t.someKey.anotherKey
extension BuildContextTranslationsExtension on BuildContext {
	Translations get t => TranslationProvider.of(this).translations;
}

/// Manages all translation instances and the current locale
class LocaleSettings extends BaseFlutterLocaleSettings<AppLocale, Translations> {
	LocaleSettings._() : super(utils: AppLocaleUtils.instance);

	static final instance = LocaleSettings._();

	// static aliases (checkout base methods for documentation)
	static AppLocale get currentLocale => instance.currentLocale;
	static Stream<AppLocale> getLocaleStream() => instance.getLocaleStream();
	static AppLocale setLocale(AppLocale locale, {bool? listenToDeviceLocale = false}) => instance.setLocale(locale, listenToDeviceLocale: listenToDeviceLocale);
	static AppLocale setLocaleRaw(String rawLocale, {bool? listenToDeviceLocale = false}) => instance.setLocaleRaw(rawLocale, listenToDeviceLocale: listenToDeviceLocale);
	static AppLocale useDeviceLocale() => instance.useDeviceLocale();
	@Deprecated('Use [AppLocaleUtils.supportedLocales]') static List<Locale> get supportedLocales => instance.supportedLocales;
	@Deprecated('Use [AppLocaleUtils.supportedLocalesRaw]') static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
	static void setPluralResolver({String? language, AppLocale? locale, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver}) => instance.setPluralResolver(
		language: language,
		locale: locale,
		cardinalResolver: cardinalResolver,
		ordinalResolver: ordinalResolver,
	);
}

/// Provides utility functions without any side effects.
class AppLocaleUtils extends BaseAppLocaleUtils<AppLocale, Translations> {
	AppLocaleUtils._() : super(baseLocale: _baseLocale, locales: AppLocale.values);

	static final instance = AppLocaleUtils._();

	// static aliases (checkout base methods for documentation)
	static AppLocale parse(String rawLocale) => instance.parse(rawLocale);
	static AppLocale parseLocaleParts({required String languageCode, String? scriptCode, String? countryCode}) => instance.parseLocaleParts(languageCode: languageCode, scriptCode: scriptCode, countryCode: countryCode);
	static AppLocale findDeviceLocale() => instance.findDeviceLocale();
	static List<Locale> get supportedLocales => instance.supportedLocales;
	static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
}

// translations

// Path: <root>
class Translations implements BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	// Translations
	late final _StringsSearchEn search = _StringsSearchEn._(_root);
	late final _StringsHomepageEn homepage = _StringsHomepageEn._(_root);
	late final _StringsNavbarEn navbar = _StringsNavbarEn._(_root);
	late final _StringsCartEn cart = _StringsCartEn._(_root);
	late final _StringsErrorsEn errors = _StringsErrorsEn._(_root);
	late final _StringsLoginEn login = _StringsLoginEn._(_root);
	late final _StringsRegisterEn register = _StringsRegisterEn._(_root);
}

// Path: search
class _StringsSearchEn {
	_StringsSearchEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get hint => 'What do you want to eat today?';
	String get noResult => 'No search results';
	String get addToCart => 'Add';
	String get loadFailed => 'Load failed';
	String get tryAnotherKeyword => 'Try another keyword';
}

// Path: homepage
class _StringsHomepageEn {
	_StringsHomepageEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get hello => 'Hello';
	String get welcome => 'Welcome!';
}

// Path: navbar
class _StringsNavbarEn {
	_StringsNavbarEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get settings => 'Settings';
	String get order => 'Order';
}

// Path: cart
class _StringsCartEn {
	_StringsCartEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get addedToCart => 'has been added to the cart';
}

// Path: errors
class _StringsErrorsEn {
	_StringsErrorsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get connectionError => 'Connection error';
	String get retry => 'Retry';
}

// Path: login
class _StringsLoginEn {
	_StringsLoginEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Welcome Back!';
	String get emailLabel => 'Email';
	String get emailHint => 'Enter your email';
	String get passwordLabel => 'Password';
	String get passwordHint => 'Enter your password';
	String get loginButton => 'Login';
	String get successMessage => 'Login successful!';
	String get errorMessage => 'Please fill in all fields';
	String get invalidCredentialsMessage => 'Invalid email or password.';
	String get genericErrorMessage => 'An error occurred. Please try again.';
	String get registerLink => 'Not registered yet? Click here to sign up';
}

// Path: register
class _StringsRegisterEn {
	_StringsRegisterEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Create an Account';
	String get emailLabel => 'Email';
	String get emailHint => 'Enter your email';
	String get passwordLabel => 'Password';
	String get passwordHint => 'Enter your password';
	String get confirmPasswordLabel => 'Confirm Password';
	String get confirmPasswordHint => 'Confirm your password';
	String get captchaLabel => 'Verification Code';
	String get captchaHint => 'Enter the verification code';
	String get sendCaptchaButton => 'Send Code';
	String get captchaSentMessage => 'Code sent successfully!';
	String get registerButton => 'Register';
	String get successMessage => 'Registration successful!';
	String get passwordMismatchMessage => 'Passwords do not match';
	String get errorMessage => 'Please fill in all fields';
}

// Path: <root>
class _StringsNl implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsNl.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.nl,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <nl>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	@override late final _StringsNl _root = this; // ignore: unused_field

	// Translations
	@override late final _StringsSearchNl search = _StringsSearchNl._(_root);
	@override late final _StringsHomepageNl homepage = _StringsHomepageNl._(_root);
	@override late final _StringsNavbarNl navbar = _StringsNavbarNl._(_root);
	@override late final _StringsCartNl cart = _StringsCartNl._(_root);
	@override late final _StringsErrorsNl errors = _StringsErrorsNl._(_root);
	@override late final _StringsLoginNl login = _StringsLoginNl._(_root);
	@override late final _StringsRegisterNl register = _StringsRegisterNl._(_root);
}

// Path: search
class _StringsSearchNl implements _StringsSearchEn {
	_StringsSearchNl._(this._root);

	@override final _StringsNl _root; // ignore: unused_field

	// Translations
	@override String get hint => 'Wat wil je vandaag eten?';
	@override String get noResult => 'Geen zoekresultaten';
	@override String get addToCart => 'Toevoegen';
	@override String get loadFailed => 'Laden mislukt';
	@override String get tryAnotherKeyword => 'Probeer een ander zoekwoord';
}

// Path: homepage
class _StringsHomepageNl implements _StringsHomepageEn {
	_StringsHomepageNl._(this._root);

	@override final _StringsNl _root; // ignore: unused_field

	// Translations
	@override String get hello => 'Hallo';
	@override String get welcome => 'Welkom!';
}

// Path: navbar
class _StringsNavbarNl implements _StringsNavbarEn {
	_StringsNavbarNl._(this._root);

	@override final _StringsNl _root; // ignore: unused_field

	// Translations
	@override String get settings => 'Instellingen';
	@override String get order => 'Bestellen';
}

// Path: cart
class _StringsCartNl implements _StringsCartEn {
	_StringsCartNl._(this._root);

	@override final _StringsNl _root; // ignore: unused_field

	// Translations
	@override String get addedToCart => 'is toegevoegd aan de winkelwagen';
}

// Path: errors
class _StringsErrorsNl implements _StringsErrorsEn {
	_StringsErrorsNl._(this._root);

	@override final _StringsNl _root; // ignore: unused_field

	// Translations
	@override String get connectionError => 'Verbindingsfout';
	@override String get retry => 'Probeer opnieuw';
}

// Path: login
class _StringsLoginNl implements _StringsLoginEn {
	_StringsLoginNl._(this._root);

	@override final _StringsNl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Welkom terug!';
	@override String get emailLabel => 'E-mail';
	@override String get emailHint => 'Voer uw e-mail in';
	@override String get passwordLabel => 'Wachtwoord';
	@override String get passwordHint => 'Voer uw wachtwoord in';
	@override String get loginButton => 'Inloggen';
	@override String get successMessage => 'Inloggen succesvol!';
	@override String get errorMessage => 'Vul alle velden in';
	@override String get invalidCredentialsMessage => 'Ongeldige e-mail of wachtwoord.';
	@override String get genericErrorMessage => 'Er is een fout opgetreden. Probeer het opnieuw.';
	@override String get registerLink => 'Nog niet geregistreerd? Meld u hier aan.';
}

// Path: register
class _StringsRegisterNl implements _StringsRegisterEn {
	_StringsRegisterNl._(this._root);

	@override final _StringsNl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Account aanmaken';
	@override String get emailLabel => 'E-mail';
	@override String get emailHint => 'Voer uw e-mail in';
	@override String get passwordLabel => 'Wachtwoord';
	@override String get passwordHint => 'Voer uw wachtwoord in';
	@override String get confirmPasswordLabel => 'Bevestig wachtwoord';
	@override String get confirmPasswordHint => 'Bevestig uw wachtwoord';
	@override String get captchaLabel => 'Verificatiecode';
	@override String get captchaHint => 'Voer de verificatiecode in';
	@override String get sendCaptchaButton => 'Verzend code';
	@override String get captchaSentMessage => 'Code succesvol verzonden!';
	@override String get registerButton => 'Registreren';
	@override String get successMessage => 'Registratie succesvol!';
	@override String get passwordMismatchMessage => 'Wachtwoorden komen niet overeen';
	@override String get errorMessage => 'Vul alle velden in';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.

extension on Translations {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'search.hint': return 'What do you want to eat today?';
			case 'search.noResult': return 'No search results';
			case 'search.addToCart': return 'Add';
			case 'search.loadFailed': return 'Load failed';
			case 'search.tryAnotherKeyword': return 'Try another keyword';
			case 'homepage.hello': return 'Hello';
			case 'homepage.welcome': return 'Welcome!';
			case 'navbar.settings': return 'Settings';
			case 'navbar.order': return 'Order';
			case 'cart.addedToCart': return 'has been added to the cart';
			case 'errors.connectionError': return 'Connection error';
			case 'errors.retry': return 'Retry';
			case 'login.title': return 'Welcome Back!';
			case 'login.emailLabel': return 'Email';
			case 'login.emailHint': return 'Enter your email';
			case 'login.passwordLabel': return 'Password';
			case 'login.passwordHint': return 'Enter your password';
			case 'login.loginButton': return 'Login';
			case 'login.successMessage': return 'Login successful!';
			case 'login.errorMessage': return 'Please fill in all fields';
			case 'login.invalidCredentialsMessage': return 'Invalid email or password.';
			case 'login.genericErrorMessage': return 'An error occurred. Please try again.';
			case 'login.registerLink': return 'Not registered yet? Click here to sign up';
			case 'register.title': return 'Create an Account';
			case 'register.emailLabel': return 'Email';
			case 'register.emailHint': return 'Enter your email';
			case 'register.passwordLabel': return 'Password';
			case 'register.passwordHint': return 'Enter your password';
			case 'register.confirmPasswordLabel': return 'Confirm Password';
			case 'register.confirmPasswordHint': return 'Confirm your password';
			case 'register.captchaLabel': return 'Verification Code';
			case 'register.captchaHint': return 'Enter the verification code';
			case 'register.sendCaptchaButton': return 'Send Code';
			case 'register.captchaSentMessage': return 'Code sent successfully!';
			case 'register.registerButton': return 'Register';
			case 'register.successMessage': return 'Registration successful!';
			case 'register.passwordMismatchMessage': return 'Passwords do not match';
			case 'register.errorMessage': return 'Please fill in all fields';
			default: return null;
		}
	}
}

extension on _StringsNl {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'search.hint': return 'Wat wil je vandaag eten?';
			case 'search.noResult': return 'Geen zoekresultaten';
			case 'search.addToCart': return 'Toevoegen';
			case 'search.loadFailed': return 'Laden mislukt';
			case 'search.tryAnotherKeyword': return 'Probeer een ander zoekwoord';
			case 'homepage.hello': return 'Hallo';
			case 'homepage.welcome': return 'Welkom!';
			case 'navbar.settings': return 'Instellingen';
			case 'navbar.order': return 'Bestellen';
			case 'cart.addedToCart': return 'is toegevoegd aan de winkelwagen';
			case 'errors.connectionError': return 'Verbindingsfout';
			case 'errors.retry': return 'Probeer opnieuw';
			case 'login.title': return 'Welkom terug!';
			case 'login.emailLabel': return 'E-mail';
			case 'login.emailHint': return 'Voer uw e-mail in';
			case 'login.passwordLabel': return 'Wachtwoord';
			case 'login.passwordHint': return 'Voer uw wachtwoord in';
			case 'login.loginButton': return 'Inloggen';
			case 'login.successMessage': return 'Inloggen succesvol!';
			case 'login.errorMessage': return 'Vul alle velden in';
			case 'login.invalidCredentialsMessage': return 'Ongeldige e-mail of wachtwoord.';
			case 'login.genericErrorMessage': return 'Er is een fout opgetreden. Probeer het opnieuw.';
			case 'login.registerLink': return 'Nog niet geregistreerd? Meld u hier aan.';
			case 'register.title': return 'Account aanmaken';
			case 'register.emailLabel': return 'E-mail';
			case 'register.emailHint': return 'Voer uw e-mail in';
			case 'register.passwordLabel': return 'Wachtwoord';
			case 'register.passwordHint': return 'Voer uw wachtwoord in';
			case 'register.confirmPasswordLabel': return 'Bevestig wachtwoord';
			case 'register.confirmPasswordHint': return 'Bevestig uw wachtwoord';
			case 'register.captchaLabel': return 'Verificatiecode';
			case 'register.captchaHint': return 'Voer de verificatiecode in';
			case 'register.sendCaptchaButton': return 'Verzend code';
			case 'register.captchaSentMessage': return 'Code succesvol verzonden!';
			case 'register.registerButton': return 'Registreren';
			case 'register.successMessage': return 'Registratie succesvol!';
			case 'register.passwordMismatchMessage': return 'Wachtwoorden komen niet overeen';
			case 'register.errorMessage': return 'Vul alle velden in';
			default: return null;
		}
	}
}
