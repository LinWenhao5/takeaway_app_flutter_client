import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:takeaway_app_flutter_client/ui/features/address_management/application/add_address_state.dart';
import 'package:takeaway_app_flutter_client/i18n/gen/strings.g.dart';
import '../application/address_provider.dart';
import '../domain/address_create_request.dart';

class AddAddressPage extends ConsumerStatefulWidget {
  const AddAddressPage({super.key});

  @override
  ConsumerState<AddAddressPage> createState() => _AddAddressPageState();
}

class _AddAddressPageState extends ConsumerState<AddAddressPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _streetController = TextEditingController();
  final _houseNumberController = TextEditingController();
  final _postcodeController = TextEditingController();
  final _cityController = TextEditingController();
  final _countryController = TextEditingController();

  bool _submitting = false;

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _streetController.dispose();
    _houseNumberController.dispose();
    _postcodeController.dispose();
    _cityController.dispose();
    _countryController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _submitting = true);

    final addNotifier = ref.read(addAddressNotifierProvider.notifier);
    final addressNotifier = ref.read(addressNotifierProvider.notifier);


    final request = AddressCreateRequest(
      name: _nameController.text,
      phone: _phoneController.text,
      street: _streetController.text,
      houseNumber: _houseNumberController.text,
      postcode: _postcodeController.text,
      city: _cityController.text,
      country: 'Netherlands',
    );
    await addNotifier.createAddress(request);
    await addressNotifier.fetchAddresses();

    setState(() => _submitting = false);
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<AddAddressState>(addAddressNotifierProvider, (previous, next) async {
      if (next.error != null && next.error!.isNotEmpty && next.success == false) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(next.error!),
          ),
        );
      }

      if (next.success && (next.error == null || next.error!.isEmpty)) {
        if (mounted) {
          Navigator.of(context).pop();
          ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(context.t.address.success),
          ),
        );
        }
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(context.t.address.add_address),
      ),
      body: Center(
        child: LayoutBuilder(
          builder: (context, constraints) {
            double maxWidth = 400;
            if (constraints.maxWidth > 600) {
              maxWidth = 600;
            }
            return ConstrainedBox(
              constraints: BoxConstraints(maxWidth: maxWidth),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Form(
                  key: _formKey,
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.secondaryContainer,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.info_outline, color: Colors.orange),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  context.t.address.areaNotice,
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 24),
                        child: Text(
                          context.t.address.formTitle,
                          style: Theme.of(context).textTheme.headlineMedium,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      TextFormField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          labelText: context.t.address.name,
                          hintText: context.t.address.nameHint,
                          helperText: context.t.address.nameHelper,
                        ),
                        validator: (v) => v == null || v.isEmpty ? context.t.address.required : null,
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _phoneController,
                        decoration: InputDecoration(
                          labelText: context.t.address.phone,
                          prefixIcon: const Icon(Icons.phone),
                          hintText: context.t.address.phoneHint,
                          helperText: context.t.address.phoneHelper,
                        ),
                        keyboardType: TextInputType.phone,
                        maxLength: 10,
                        validator: (v) => v == null || v.isEmpty ? context.t.address.required : null,
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _streetController,
                        decoration: InputDecoration(
                          labelText: context.t.address.street,
                          hintText: context.t.address.streetHint,
                          helperText: context.t.address.streetHelper,
                        ),
                        validator: (v) => v == null || v.isEmpty ? context.t.address.required : null,
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: TextFormField(
                              controller: _postcodeController,
                              decoration: InputDecoration(
                                labelText: context.t.address.postcode,
                                hintText: context.t.address.postcodeHint,
                                helperText: context.t.address.postcodeHelper,
                              ),
                              validator: (v) => v == null || v.isEmpty ? context.t.address.required : null,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            flex: 1,
                            child: TextFormField(
                              controller: _houseNumberController,
                              decoration: InputDecoration(
                                labelText: context.t.address.houseNumber,
                                hintText: context.t.address.houseNumberHint,
                                helperText: context.t.address.houseNumberHelper,
                              ),
                              validator: (v) => v == null || v.isEmpty ? context.t.address.required : null,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _cityController,
                        decoration: InputDecoration(
                          labelText: context.t.address.city,
                          hintText: context.t.address.cityHint,
                          helperText: context.t.address.cityHelper,
                        ),
                        validator: (v) => v == null || v.isEmpty ? context.t.address.required : null,
                      ),
                      const SizedBox(height: 16),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 4),
                        child: Text(
                          context.t.address.country,
                          style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      const SizedBox(height: 32),
                      ElevatedButton(
                        onPressed: _submitting ? null : _submit,
                        child: _submitting
                            ? SizedBox(
                                width: 24,
                                height: 24,
                                child: SpinKitFadingCircle(
                                  color: Theme.of(context).primaryColor,
                                  size: 40.0,
                                ),
                              )
                            : Text(context.t.address.submit),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}