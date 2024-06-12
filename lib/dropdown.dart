import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(PPPDropdown());
}

class PPPDropdown extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dropdown with Search Example',
      home: DropdownWithSearchExample(),
    );
  }
}

class DropdownWithSearchExample extends StatefulWidget {
  @override
  _DropdownWithSearchExampleState createState() =>
      _DropdownWithSearchExampleState();
}

class _DropdownWithSearchExampleState extends State<DropdownWithSearchExample> {
  TextEditingController _searchController = TextEditingController();
  GlobalKey<AutoCompleteTextFieldState<String>> _key = GlobalKey();
  List<String> _options = ['Option 1', 'Option 2', 'Option 3'];
  String? _selectedOption;
  double _iconSize = 24.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dropdown with Search Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AutoCompleteTextField<String>(
              key: _key,
              clearOnSubmit: false,
              controller: _searchController,
              suggestions: _options,
              decoration: InputDecoration(
                labelText: 'Search for an option',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search), // Add icon here
                suffixIcon: PopupMenuButton<String>(
                  itemBuilder: (context) => _options
                      .map((option) => PopupMenuItem<String>(
                            value: option,
                            child: Text(option),
                          ))
                      .toList(),
                  icon: Icon(Icons.arrow_drop_down,
                      size: _iconSize), // Add arrow icon here
                  onSelected: (String value) {
                    setState(() {
                      _selectedOption = value;
                      _searchController.text = value;
                      _iconSize =
                          24.0; // Reset icon size when an option is selected
                    });
                  },
                  onCanceled: () {
                    setState(() {
                      _iconSize =
                          24.0; // Reset icon size when dropdown is canceled
                    });
                  },
                ),
              ),
              itemFilter: (item, query) {
                return item.toLowerCase().contains(query.toLowerCase());
              },
              itemSorter: (a, b) {
                return a.compareTo(b);
              },
              itemSubmitted: (item) {
                setState(() {
                  _selectedOption = item;
                });
              },
              itemBuilder: (context, item) {
                return ListTile(
                  title: Text(item),
                );
              },
            ),
            SizedBox(height: 20),
            Text(
              _selectedOption ?? 'No option selected',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }

  void showDropdownMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          child: ListView.builder(
            itemCount: _options.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(_options[index]),
                onTap: () {
                  setState(() {
                    _selectedOption = _options[index];
                    _iconSize =
                        24.0; // Reset icon size when an option is selected
                  });
                  Navigator.pop(context);
                },
              );
            },
          ),
        );
      },
    );
  }
}
