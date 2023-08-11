import 'package:flutter/material.dart';
import 'package:khata_app/Provider/load_fund_provider.dart';
import 'package:provider/provider.dart';

class LoadFundScreen extends StatelessWidget {
  static const routeName = 'load-fund';
  final _formKey = GlobalKey<FormState>();
  var _loadedFund = LoadedFund(
    id: null.toString(),
    uid: null.toString(),
    amount: 0,
    dateTime: DateTime.now(),
  );
  LoadFundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Load Amount',
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Card(
                    // margin: const EdgeInsets.symmetric(horizontal: )),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    elevation: 0,
                    color: Theme.of(context)
                        .colorScheme
                        .surfaceVariant
                        .withOpacity(.35),
                    child: Card(
                      margin: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 20),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: Theme.of(context).colorScheme.outlineVariant,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: TextFormField(
                          onSaved: (value) {
                            _loadedFund = LoadedFund(
                              id: _loadedFund.id,
                              uid: _loadedFund.uid,
                              amount: double.parse(value!),
                              dateTime: _loadedFund.dateTime,
                            );
                          },
                          magnifierConfiguration:
                              const TextMagnifierConfiguration(),
                          style: TextStyle(
                              color: Theme.of(context)
                                  .colorScheme
                                  .primary
                                  .withOpacity(.7),
                              decorationThickness: 30,
                              fontWeight: FontWeight.w500,
                              fontSize: 30,
                              height: 1),
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              labelStyle: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .primary
                                      .withOpacity(.85)),
                              prefix: Padding(
                                padding: const EdgeInsets.only(right: 30),
                                child: Text(
                                  'रु',
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary
                                          .withOpacity(.6),
                                      height: 1,
                                      fontSize: 40,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              labelText: 'Amount',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                          textInputAction: TextInputAction.next,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: const Color.fromARGB(255, 9, 1, 31),
                      backgroundColor: Theme.of(context).primaryColor,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 13),
                      elevation: 10,
                      shadowColor: Theme.of(context).colorScheme.primary,
                    ),
                    // Method-2
                    // style: ButtonStyle(
                    //     backgroundColor: MaterialStateProperty.all(
                    //         Theme.of(context).primaryColor),
                    //     overlayColor: MaterialStateProperty.all<Color>(
                    //         const Color.fromARGB(200, 3, 15, 53))),
                    // Method-1
                    // style: ElevatedButton.styleFrom(
                    //   foregroundColor:const Color.fromARGB(255, 9, 1, 31),
                    //   animationDuration: const Duration(milliseconds: 50),
                    //   backgroundColor: Theme.of(context).primaryColor,
                    //   padding: const EdgeInsets.symmetric(
                    //       horizontal: 50, vertical: 13),
                    //   elevation: 10,
                    //   shadowColor: Theme.of(context).colorScheme.primary,
                    // ),
                    onPressed: () {
                      FocusScope.of(context).unfocus();

                      _saveForm(context);
                    },
                    child: Text(
                      'Load Fund',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary,
                          fontSize: 20),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }

  void _saveForm(BuildContext context) {
    _formKey.currentState!.save();
    Provider.of<LoadedFundProvider>(context, listen: false)
        .addFund(_loadedFund);
    _formKey.currentState!.reset();
    Navigator.of(context).pop();
  }
}
