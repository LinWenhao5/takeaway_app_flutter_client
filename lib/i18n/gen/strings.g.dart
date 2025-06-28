/// Generated file. Do not edit.
///
/// Original: lib/i18n/translations
/// To regenerate, run: `dart run slang`
///
/// Locales: 2
/// Strings: 138 (69 per locale)
///
/// Built on 2025-06-28 at 11:48 UTC

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
	late final _StringsSettingsEn settings = _StringsSettingsEn._(_root);
}

// Path: search
class _StringsSearchEn {
	_StringsSearchEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get hint => 'What are you craving today?';
	String get noResult => 'No results found';
	String get addToCart => 'Add to cart';
	String get loadFailed => 'Failed to load';
	String get tryAnotherKeyword => 'Try a different keyword';
}

// Path: homepage
class _StringsHomepageEn {
	_StringsHomepageEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get hello => 'Hi there';
	String get welcome => 'Welcome to our app!';
}

// Path: navbar
class _StringsNavbarEn {
	_StringsNavbarEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get profile => 'My Profile';
	String get order => 'Orders';
}

// Path: cart
class _StringsCartEn {
	_StringsCartEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get checkout_basket => 'Checkout Basket';
	String get emptyCartMessage => 'Your cart is empty!';
	String get addItemsMessage => 'Go ahead and add some items to see them here.';
	String get addedToCart => '{productName} has been successfully added to your cart!';
	String get totalQuantity => 'Items in Cart';
	String get totalPrice => 'Total Amount';
	String get price => 'Price';
	String get proceedToCheckout => 'Proceed to Checkout';
}

// Path: errors
class _StringsErrorsEn {
	_StringsErrorsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get connectionError => 'There was a connection issue.';
	String get retry => 'Tap here to retry';
	String get invalidEmailMessage => 'The email address you entered is invalid.';
	String get genericErrorMessage => 'Something went wrong. Please try again later.';
	String get invalidCredentialsMessage => 'The credentials you entered are incorrect.';
	String get invalidEmailFormatMessage => 'The email format is invalid.';
	String get invalidPasswordMessage => 'The password does not meet the requirements.';
	String get emailTakenMessage => 'This email is already registered.';
	String get invalidCaptchaMessage => 'The verification code you entered is invalid.';
	String get unauthorizedMessage => 'You don\'t have access. Please log in and try again.';
}

// Path: login
class _StringsLoginEn {
	_StringsLoginEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Welcome back!';
	String get emailLabel => 'Email Address';
	String get emailHint => 'Enter your email address';
	String get passwordLabel => 'Password';
	String get passwordHint => 'Enter your password';
	String get loginButton => 'Log In';
	String get successMessage => 'You have successfully logged in!';
	String get errorMessage => 'Please complete all required fields';
	String get registerLink => 'Don\'t have an account yet? Sign up here.';
}

// Path: register
class _StringsRegisterEn {
	_StringsRegisterEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Create a New Account';
	String get nameLabel => 'Full Name';
	String get nameHint => 'Enter your full name';
	String get emailLabel => 'Email Address';
	String get emailHint => 'Enter your email address';
	String get passwordLabel => 'Password';
	String get passwordHint => 'Choose a strong password';
	String get confirmPasswordLabel => 'Confirm Password';
	String get confirmPasswordHint => 'Re-enter your password';
	String get captchaLabel => 'Verification Code';
	String get captchaHint => 'Enter the verification code';
	String get sendCaptchaButton => 'Send Code';
	String get captchaSentMessage => 'Verification code sent successfully!';
	String get registerButton => 'Sign Up';
	String get successMessage => 'Your account has been created successfully!';
	String get passwordMismatchMessage => 'The passwords do not match.';
	String get errorMessage => 'Please fill in all required fields to proceed';
}

// Path: settings
class _StringsSettingsEn {
	_StringsSettingsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get language => 'Language';
	String get theme => 'Theme';
	String get themeSystem => 'System';
	String get themeLight => 'Light';
	String get themeDark => 'Dark';
	String get login_prompt => 'Sign in to start your delicious adventure 🍣';
	String get sign_in_now => 'Sign In Now';
	String get failed_to_load => 'Failed to load username';
	late final _StringsSettingsGreetingsEn greetings = _StringsSettingsGreetingsEn._(_root);
}

// Path: settings.greetings
class _StringsSettingsGreetingsEn {
	_StringsSettingsGreetingsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get early_morning => 'Up early? Wishing you a peaceful morning 🌙';
	String get morning => 'Good morning! Hope you have a great start ☀️';
	String get forenoon => 'Hope your morning is going well 🌤️';
	String get noon => 'Happy lunch time! Enjoy your meal 🥪';
	String get afternoon => 'Good afternoon! How about some fresh sushi? 🌞';
	String get evening => 'Good evening! Treat yourself to sushi tonight 🌇';
	String get night => 'Good night! Sweet dreams 🌙';
	String get hello => 'Hello there! 👋';
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
	@override late final _StringsSettingsNl settings = _StringsSettingsNl._(_root);
}

// Path: search
class _StringsSearchNl implements _StringsSearchEn {
	_StringsSearchNl._(this._root);

	@override final _StringsNl _root; // ignore: unused_field

	// Translations
	@override String get hint => 'Waar heb je vandaag trek in?';
	@override String get noResult => 'Geen resultaten gevonden';
	@override String get addToCart => 'Toevoegen aan winkelwagen';
	@override String get loadFailed => 'Het laden is mislukt';
	@override String get tryAnotherKeyword => 'Probeer een ander zoekwoord';
}

// Path: homepage
class _StringsHomepageNl implements _StringsHomepageEn {
	_StringsHomepageNl._(this._root);

	@override final _StringsNl _root; // ignore: unused_field

	// Translations
	@override String get hello => 'Hoi';
	@override String get welcome => 'Welkom bij ons!';
}

// Path: navbar
class _StringsNavbarNl implements _StringsNavbarEn {
	_StringsNavbarNl._(this._root);

	@override final _StringsNl _root; // ignore: unused_field

	// Translations
	@override String get profile => 'Mijn Profiel';
	@override String get order => 'Bestellingen';
}

// Path: cart
class _StringsCartNl implements _StringsCartEn {
	_StringsCartNl._(this._root);

	@override final _StringsNl _root; // ignore: unused_field

	// Translations
	@override String get checkout_basket => 'Afrekenmandje';
	@override String get emptyCartMessage => 'Je winkelwagen is leeg!';
	@override String get addItemsMessage => 'Voeg wat items toe om ze hier te zien.';
	@override String get addedToCart => '{productName} is succesvol toegevoegd aan je winkelwagen!';
	@override String get totalQuantity => 'Aantal items';
	@override String get totalPrice => 'Totaal bedrag';
	@override String get price => 'Prijs';
	@override String get proceedToCheckout => 'Ga naar afrekenen';
}

// Path: errors
class _StringsErrorsNl implements _StringsErrorsEn {
	_StringsErrorsNl._(this._root);

	@override final _StringsNl _root; // ignore: unused_field

	// Translations
	@override String get connectionError => 'Er is een verbindingsprobleem opgetreden';
	@override String get retry => 'Klik hier om opnieuw te proberen';
	@override String get invalidEmailMessage => 'Het ingevoerde e-mailadres is ongeldig.';
	@override String get genericErrorMessage => 'Er is iets misgegaan. Probeer het later opnieuw.';
	@override String get invalidCredentialsMessage => 'De ingevoerde gegevens zijn onjuist.';
	@override String get invalidEmailFormatMessage => 'Het e-mailadres heeft een ongeldig formaat.';
	@override String get invalidPasswordMessage => 'Het wachtwoord voldoet niet aan de vereisten.';
	@override String get emailTakenMessage => 'Dit e-mailadres is al geregistreerd.';
	@override String get invalidCaptchaMessage => 'De ingevoerde verificatiecode is ongeldig.';
	@override String get unauthorizedMessage => 'Je hebt geen toegang. Log in en probeer het opnieuw.';
}

// Path: login
class _StringsLoginNl implements _StringsLoginEn {
	_StringsLoginNl._(this._root);

	@override final _StringsNl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Fijn je weer te zien!';
	@override String get emailLabel => 'E-mailadres';
	@override String get emailHint => 'Vul je e-mailadres in';
	@override String get passwordLabel => 'Wachtwoord';
	@override String get passwordHint => 'Vul je wachtwoord in';
	@override String get loginButton => 'Inloggen';
	@override String get successMessage => 'Je bent succesvol ingelogd!';
	@override String get errorMessage => 'Vul alle verplichte velden in';
	@override String get registerLink => 'Nog geen account? Registreer je hier.';
}

// Path: register
class _StringsRegisterNl implements _StringsRegisterEn {
	_StringsRegisterNl._(this._root);

	@override final _StringsNl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Maak een nieuw account aan';
	@override String get nameLabel => 'Volledige naam';
	@override String get nameHint => 'Vul je volledige naam in';
	@override String get emailLabel => 'E-mailadres';
	@override String get emailHint => 'Vul je e-mailadres in';
	@override String get passwordLabel => 'Wachtwoord';
	@override String get passwordHint => 'Kies een sterk wachtwoord';
	@override String get confirmPasswordLabel => 'Bevestig wachtwoord';
	@override String get confirmPasswordHint => 'Herhaal je wachtwoord';
	@override String get captchaLabel => 'Verificatiecode';
	@override String get captchaHint => 'Vul de verificatiecode in';
	@override String get sendCaptchaButton => 'Code verzenden';
	@override String get captchaSentMessage => 'De code is succesvol verzonden!';
	@override String get registerButton => 'Registreren';
	@override String get successMessage => 'Je account is succesvol aangemaakt!';
	@override String get passwordMismatchMessage => 'De wachtwoorden komen niet overeen.';
	@override String get errorMessage => 'Vul alle verplichte velden in om verder te gaan';
}

// Path: settings
class _StringsSettingsNl implements _StringsSettingsEn {
	_StringsSettingsNl._(this._root);

	@override final _StringsNl _root; // ignore: unused_field

	// Translations
	@override String get language => 'Taal';
	@override String get theme => 'Thema';
	@override String get themeSystem => 'Systeem';
	@override String get themeLight => 'Licht';
	@override String get themeDark => 'Donker';
	@override String get login_prompt => 'Log in om je heerlijke avontuur te beginnen 🍣';
	@override String get sign_in_now => 'Nu inloggen';
	@override String get failed_to_load => 'Gebruikersnaam laden mislukt';
	@override late final _StringsSettingsGreetingsNl greetings = _StringsSettingsGreetingsNl._(_root);
}

// Path: settings.greetings
class _StringsSettingsGreetingsNl implements _StringsSettingsGreetingsEn {
	_StringsSettingsGreetingsNl._(this._root);

	@override final _StringsNl _root; // ignore: unused_field

	// Translations
	@override String get early_morning => 'Goedemorgen, vroege vogel! 🌙';
	@override String get morning => 'Goedemorgen! ☀️';
	@override String get forenoon => 'Fijne ochtend! 🌤️';
	@override String get noon => 'Eet smakelijk tijdens de lunch! 🥪';
	@override String get afternoon => 'Goedemiddag! Zin in verse sushi? 🌞';
	@override String get evening => 'Goede avond! Trakteer jezelf op sushi vanavond 🌇';
	@override String get night => 'Welterusten! 🌙';
	@override String get hello => 'Hallo daar! 👋';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.

extension on Translations {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'search.hint': return 'What are you craving today?';
			case 'search.noResult': return 'No results found';
			case 'search.addToCart': return 'Add to cart';
			case 'search.loadFailed': return 'Failed to load';
			case 'search.tryAnotherKeyword': return 'Try a different keyword';
			case 'homepage.hello': return 'Hi there';
			case 'homepage.welcome': return 'Welcome to our app!';
			case 'navbar.profile': return 'My Profile';
			case 'navbar.order': return 'Orders';
			case 'cart.checkout_basket': return 'Checkout Basket';
			case 'cart.emptyCartMessage': return 'Your cart is empty!';
			case 'cart.addItemsMessage': return 'Go ahead and add some items to see them here.';
			case 'cart.addedToCart': return '{productName} has been successfully added to your cart!';
			case 'cart.totalQuantity': return 'Items in Cart';
			case 'cart.totalPrice': return 'Total Amount';
			case 'cart.price': return 'Price';
			case 'cart.proceedToCheckout': return 'Proceed to Checkout';
			case 'errors.connectionError': return 'There was a connection issue.';
			case 'errors.retry': return 'Tap here to retry';
			case 'errors.invalidEmailMessage': return 'The email address you entered is invalid.';
			case 'errors.genericErrorMessage': return 'Something went wrong. Please try again later.';
			case 'errors.invalidCredentialsMessage': return 'The credentials you entered are incorrect.';
			case 'errors.invalidEmailFormatMessage': return 'The email format is invalid.';
			case 'errors.invalidPasswordMessage': return 'The password does not meet the requirements.';
			case 'errors.emailTakenMessage': return 'This email is already registered.';
			case 'errors.invalidCaptchaMessage': return 'The verification code you entered is invalid.';
			case 'errors.unauthorizedMessage': return 'You don\'t have access. Please log in and try again.';
			case 'login.title': return 'Welcome back!';
			case 'login.emailLabel': return 'Email Address';
			case 'login.emailHint': return 'Enter your email address';
			case 'login.passwordLabel': return 'Password';
			case 'login.passwordHint': return 'Enter your password';
			case 'login.loginButton': return 'Log In';
			case 'login.successMessage': return 'You have successfully logged in!';
			case 'login.errorMessage': return 'Please complete all required fields';
			case 'login.registerLink': return 'Don\'t have an account yet? Sign up here.';
			case 'register.title': return 'Create a New Account';
			case 'register.nameLabel': return 'Full Name';
			case 'register.nameHint': return 'Enter your full name';
			case 'register.emailLabel': return 'Email Address';
			case 'register.emailHint': return 'Enter your email address';
			case 'register.passwordLabel': return 'Password';
			case 'register.passwordHint': return 'Choose a strong password';
			case 'register.confirmPasswordLabel': return 'Confirm Password';
			case 'register.confirmPasswordHint': return 'Re-enter your password';
			case 'register.captchaLabel': return 'Verification Code';
			case 'register.captchaHint': return 'Enter the verification code';
			case 'register.sendCaptchaButton': return 'Send Code';
			case 'register.captchaSentMessage': return 'Verification code sent successfully!';
			case 'register.registerButton': return 'Sign Up';
			case 'register.successMessage': return 'Your account has been created successfully!';
			case 'register.passwordMismatchMessage': return 'The passwords do not match.';
			case 'register.errorMessage': return 'Please fill in all required fields to proceed';
			case 'settings.language': return 'Language';
			case 'settings.theme': return 'Theme';
			case 'settings.themeSystem': return 'System';
			case 'settings.themeLight': return 'Light';
			case 'settings.themeDark': return 'Dark';
			case 'settings.login_prompt': return 'Sign in to start your delicious adventure 🍣';
			case 'settings.sign_in_now': return 'Sign In Now';
			case 'settings.failed_to_load': return 'Failed to load username';
			case 'settings.greetings.early_morning': return 'Up early? Wishing you a peaceful morning 🌙';
			case 'settings.greetings.morning': return 'Good morning! Hope you have a great start ☀️';
			case 'settings.greetings.forenoon': return 'Hope your morning is going well 🌤️';
			case 'settings.greetings.noon': return 'Happy lunch time! Enjoy your meal 🥪';
			case 'settings.greetings.afternoon': return 'Good afternoon! How about some fresh sushi? 🌞';
			case 'settings.greetings.evening': return 'Good evening! Treat yourself to sushi tonight 🌇';
			case 'settings.greetings.night': return 'Good night! Sweet dreams 🌙';
			case 'settings.greetings.hello': return 'Hello there! 👋';
			default: return null;
		}
	}
}

extension on _StringsNl {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'search.hint': return 'Waar heb je vandaag trek in?';
			case 'search.noResult': return 'Geen resultaten gevonden';
			case 'search.addToCart': return 'Toevoegen aan winkelwagen';
			case 'search.loadFailed': return 'Het laden is mislukt';
			case 'search.tryAnotherKeyword': return 'Probeer een ander zoekwoord';
			case 'homepage.hello': return 'Hoi';
			case 'homepage.welcome': return 'Welkom bij ons!';
			case 'navbar.profile': return 'Mijn Profiel';
			case 'navbar.order': return 'Bestellingen';
			case 'cart.checkout_basket': return 'Afrekenmandje';
			case 'cart.emptyCartMessage': return 'Je winkelwagen is leeg!';
			case 'cart.addItemsMessage': return 'Voeg wat items toe om ze hier te zien.';
			case 'cart.addedToCart': return '{productName} is succesvol toegevoegd aan je winkelwagen!';
			case 'cart.totalQuantity': return 'Aantal items';
			case 'cart.totalPrice': return 'Totaal bedrag';
			case 'cart.price': return 'Prijs';
			case 'cart.proceedToCheckout': return 'Ga naar afrekenen';
			case 'errors.connectionError': return 'Er is een verbindingsprobleem opgetreden';
			case 'errors.retry': return 'Klik hier om opnieuw te proberen';
			case 'errors.invalidEmailMessage': return 'Het ingevoerde e-mailadres is ongeldig.';
			case 'errors.genericErrorMessage': return 'Er is iets misgegaan. Probeer het later opnieuw.';
			case 'errors.invalidCredentialsMessage': return 'De ingevoerde gegevens zijn onjuist.';
			case 'errors.invalidEmailFormatMessage': return 'Het e-mailadres heeft een ongeldig formaat.';
			case 'errors.invalidPasswordMessage': return 'Het wachtwoord voldoet niet aan de vereisten.';
			case 'errors.emailTakenMessage': return 'Dit e-mailadres is al geregistreerd.';
			case 'errors.invalidCaptchaMessage': return 'De ingevoerde verificatiecode is ongeldig.';
			case 'errors.unauthorizedMessage': return 'Je hebt geen toegang. Log in en probeer het opnieuw.';
			case 'login.title': return 'Fijn je weer te zien!';
			case 'login.emailLabel': return 'E-mailadres';
			case 'login.emailHint': return 'Vul je e-mailadres in';
			case 'login.passwordLabel': return 'Wachtwoord';
			case 'login.passwordHint': return 'Vul je wachtwoord in';
			case 'login.loginButton': return 'Inloggen';
			case 'login.successMessage': return 'Je bent succesvol ingelogd!';
			case 'login.errorMessage': return 'Vul alle verplichte velden in';
			case 'login.registerLink': return 'Nog geen account? Registreer je hier.';
			case 'register.title': return 'Maak een nieuw account aan';
			case 'register.nameLabel': return 'Volledige naam';
			case 'register.nameHint': return 'Vul je volledige naam in';
			case 'register.emailLabel': return 'E-mailadres';
			case 'register.emailHint': return 'Vul je e-mailadres in';
			case 'register.passwordLabel': return 'Wachtwoord';
			case 'register.passwordHint': return 'Kies een sterk wachtwoord';
			case 'register.confirmPasswordLabel': return 'Bevestig wachtwoord';
			case 'register.confirmPasswordHint': return 'Herhaal je wachtwoord';
			case 'register.captchaLabel': return 'Verificatiecode';
			case 'register.captchaHint': return 'Vul de verificatiecode in';
			case 'register.sendCaptchaButton': return 'Code verzenden';
			case 'register.captchaSentMessage': return 'De code is succesvol verzonden!';
			case 'register.registerButton': return 'Registreren';
			case 'register.successMessage': return 'Je account is succesvol aangemaakt!';
			case 'register.passwordMismatchMessage': return 'De wachtwoorden komen niet overeen.';
			case 'register.errorMessage': return 'Vul alle verplichte velden in om verder te gaan';
			case 'settings.language': return 'Taal';
			case 'settings.theme': return 'Thema';
			case 'settings.themeSystem': return 'Systeem';
			case 'settings.themeLight': return 'Licht';
			case 'settings.themeDark': return 'Donker';
			case 'settings.login_prompt': return 'Log in om je heerlijke avontuur te beginnen 🍣';
			case 'settings.sign_in_now': return 'Nu inloggen';
			case 'settings.failed_to_load': return 'Gebruikersnaam laden mislukt';
			case 'settings.greetings.early_morning': return 'Goedemorgen, vroege vogel! 🌙';
			case 'settings.greetings.morning': return 'Goedemorgen! ☀️';
			case 'settings.greetings.forenoon': return 'Fijne ochtend! 🌤️';
			case 'settings.greetings.noon': return 'Eet smakelijk tijdens de lunch! 🥪';
			case 'settings.greetings.afternoon': return 'Goedemiddag! Zin in verse sushi? 🌞';
			case 'settings.greetings.evening': return 'Goede avond! Trakteer jezelf op sushi vanavond 🌇';
			case 'settings.greetings.night': return 'Welterusten! 🌙';
			case 'settings.greetings.hello': return 'Hallo daar! 👋';
			default: return null;
		}
	}
}
