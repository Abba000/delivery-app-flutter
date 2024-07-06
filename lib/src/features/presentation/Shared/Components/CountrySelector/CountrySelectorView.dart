// ignore_for_file: must_be_immutable, file_names, use_key_in_widget_constructors, library_private_types_in_public_api

/*import 'package:flutter/material.dart';
import 'package:flutter_application_test/src/colors/colors.dart';

mixin CountrySelectorViewDelegate {
  onCountrySelected({required Country country});
}

class CountrySelectorView extends StatefulWidget {
  CountrySelectorViewDelegate? delegate;

  CountrySelectorView({required this.delegate});

  @override
  _CountrySelectorViewState createState() => _CountrySelectorViewState();
}

class _CountrySelectorViewState extends State<CountrySelectorView> {
  final List<Country> _countries = CountryHelper.countries;
  final TextEditingController _searchController = TextEditingController();

  List<Country> _filteredCountries = [];
  Country? _selectedCountry;

  @override
  void initState() {
    super.initState();
    _filteredCountries = _countries;
    _searchController.addListener(_onSearchTextChanged);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: naranja,
        leading: IconButton(
          icon: const Icon(
            Icons.close,
            color: Colors.white,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Select a country',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                iconColor: naranja,
                focusColor: naranja,
                labelText: 'Search',
                labelStyle: TextStyle(color: naranja),
                hintText: 'Search for a country',
                prefixIcon: Icon(
                  Icons.search,
                  color: naranja,
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: naranja),
                  borderRadius: BorderRadius.all(
                    Radius.circular(16.0),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: naranja),
                  borderRadius: BorderRadius.all(
                    Radius.circular(16.0),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredCountries.length,
              itemBuilder: (BuildContext context, int index) {
                final country = _filteredCountries[index];

                return ListTile(
                  leading: Radio<Country>(
                    activeColor: naranja,
                    value: country,
                    groupValue: _selectedCountry,
                    onChanged: (Country? value) {
                      setState(() {
                        // Null Check
                        if (value == null) {
                          return;
                        }
                        _selectedCountry = value;
                        widget.delegate?.onCountrySelected(country: value);
                        Navigator.pop(context);
                      });
                    },
                  ),
                  title: Text(country.name),
                  onTap: () {
                    setState(() {
                      _selectedCountry = country;
                      widget.delegate?.onCountrySelected(country: country);
                      Navigator.pop(context);
                    });
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

extension PrivateMethods on _CountrySelectorViewState {
  void _onSearchTextChanged() {
    setState(() {
      _filteredCountries = _countries
          .where((country) => country.name
              .toLowerCase()
              .contains(_searchController.text.toLowerCase()))
          .toList();
    });
  }
}*/
