import 'package:deli_meals/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filter-screen';
  final Function setFilters;
  final Map<String, bool> filters;
  FilterScreen(this.setFilters, this.filters);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree = false;
  var _vegy = false;
  var _vegan = false;
  var _lactoseFree = false;

  @override
  void initState() {
    super.initState();
    _glutenFree = widget.filters['gluten'];
    _vegy = widget.filters['vegy'];
    _vegan = widget.filters['vegan'];
    _lactoseFree = widget.filters['lactose'];
  }

  Widget _buildSwitchListTile(
    String title,
    String desc,
    bool val,
    Function updateValue,
  ) {
    return SwitchListTile(
      onChanged: updateValue,
      title: Text(title),
      value: val,
      subtitle: (Text(desc)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Filters'), actions: [
        IconButton(
          icon: const Icon(Icons.save),
          onPressed: (() {
            Map<String, bool> filters = {
              'gluten': _glutenFree,
              'lactose': _lactoseFree,
              'vegan': _vegan,
              'vegy': _vegy,
            };
            widget.setFilters(filters);
          }),
        )
      ]),
      drawer: MainDrawer(),
      body: Column(children: [
        Container(
          padding: const EdgeInsets.all(20),
          child: Text('Adjust your meal selection.',
              style: Theme.of(context).textTheme.headline6),
        ),
        Expanded(
            child: ListView(
          children: [
            _buildSwitchListTile(
              'Gluten-free',
              'Only inlcude these',
              _glutenFree,
              (newValue) {
                setState(
                  () {
                    _glutenFree = newValue;
                  },
                );
              },
            ),
            _buildSwitchListTile(
              'Lactose-free',
              'Only include these',
              _lactoseFree,
              (newValue) {
                setState(
                  () {
                    _lactoseFree = newValue;
                  },
                );
              },
            ),
            _buildSwitchListTile(
              'Vegan',
              'Only include Vegan',
              _vegan,
              (newValue) {
                setState(
                  () {
                    _vegan = newValue;
                  },
                );
              },
            ),
            _buildSwitchListTile(
              'Vegitarian',
              'Only include Vegitarian',
              _vegy,
              (newValue) {
                setState(
                  () {
                    _vegy = newValue;
                  },
                );
              },
            ),
          ],
        )),
      ]),
    );
  }
}
