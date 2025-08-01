import 'package:flutter/material.dart';
import 'package:takeaway_app_flutter_client/ui/features/address_management/domain/address_create_request.dart';
import 'package:takeaway_app_flutter_client/i18n/gen/strings.g.dart';

class AddressForm extends StatefulWidget {
  final AddressCreateRequest? initial;
  final bool submitting;
  final String submitLabel;
  final void Function(AddressCreateRequest) onSubmit;

  const AddressForm({
    super.key,
    this.initial,
    required this.submitting,
    required this.submitLabel,
    required this.onSubmit,
  });

  @override
  State<AddressForm> createState() => _AddressFormState();
}

class _AddressFormState extends State<AddressForm> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameController;
  late final TextEditingController _phoneController;
  late final TextEditingController _streetController;
  late final TextEditingController _houseNumberController;
  late final TextEditingController _postcodeController;
  late final TextEditingController _cityController;

  @override
  void initState() {
    super.initState();
    final i = widget.initial;
    _nameController = TextEditingController(text: i?.name ?? '');
    _phoneController = TextEditingController(text: i?.phone ?? '');
    _streetController = TextEditingController(text: i?.street ?? '');
    _houseNumberController = TextEditingController(text: i?.houseNumber ?? '');
    _postcodeController = TextEditingController(text: i?.postcode ?? '');
    _cityController = TextEditingController(text: i?.city ?? '');
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _streetController.dispose();
    _houseNumberController.dispose();
    _postcodeController.dispose();
    _cityController.dispose();
    super.dispose();
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;
    widget.onSubmit(
      AddressCreateRequest(
        name: _nameController.text,
        phone: _phoneController.text,
        street: _streetController.text,
        houseNumber: _houseNumberController.text,
        postcode: _postcodeController.text,
        city: _cityController.text,
        country: 'Netherlands',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double maxWidth = 400;
    return Center(
      child: LayoutBuilder(
        builder: (context, constraints) {
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
                          color:
                              Theme.of(context).colorScheme.secondaryContainer,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.info_outline,
                              color: Colors.orange,
                            ),
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
                      validator:
                          (v) =>
                              v == null || v.isEmpty
                                  ? context.t.address.required
                                  : null,
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
                      validator:
                          (v) =>
                              v == null || v.isEmpty
                                  ? context.t.address.required
                                  : null,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _streetController,
                      decoration: InputDecoration(
                        labelText: context.t.address.street,
                        hintText: context.t.address.streetHint,
                        helperText: context.t.address.streetHelper,
                      ),
                      validator:
                          (v) =>
                              v == null || v.isEmpty
                                  ? context.t.address.required
                                  : null,
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
                            validator:
                                (v) =>
                                    v == null || v.isEmpty
                                        ? context.t.address.required
                                        : null,
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
                            validator:
                                (v) =>
                                    v == null || v.isEmpty
                                        ? context.t.address.required
                                        : null,
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
                      validator:
                          (v) =>
                              v == null || v.isEmpty
                                  ? context.t.address.required
                                  : null,
                    ),
                    const SizedBox(height: 16),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 4),
                      child: Text(
                        context.t.address.country,
                        style: Theme.of(
                          context,
                        ).textTheme.labelLarge?.copyWith(color: Colors.grey),
                      ),
                    ),
                    const SizedBox(height: 32),
                    ElevatedButton(
                      onPressed: widget.submitting ? null : _submit,
                      child:
                          widget.submitting
                              ? SizedBox(
                                width: 24,
                                height: 24,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                              )
                              : Text(widget.submitLabel),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
