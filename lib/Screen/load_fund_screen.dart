import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:khata_app/Provider/load_fund_provider.dart';
import 'package:khata_app/models/loadfund.dart';

class LoadFundScreen extends ConsumerStatefulWidget {
  static const routeName = 'load-fund';

  const LoadFundScreen({super.key});

  @override
  ConsumerState<LoadFundScreen> createState() => _LoadFundScreenState();
}

class _LoadFundScreenState extends ConsumerState<LoadFundScreen> {
  bool _isadded = false;

  final _formKey = GlobalKey<FormState>();

  var _loadedFund = LoadedFund(
    uid: 'world',
    amount: 0,
    dateTime: DateTime.now(),
  );

  @override
  Widget build(BuildContext context) {
    return _isadded
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : GestureDetector(
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
                                color: Theme.of(context)
                                    .colorScheme
                                    .outlineVariant,
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
                                        borderRadius:
                                            BorderRadius.circular(20))),
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
                            foregroundColor: const Color.fromARGB(255, 0, 0, 0),
                            backgroundColor:
                                Theme.of(context).colorScheme.primary,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 50, vertical: 13),
                            // elevation: 10,
                            shadowColor: Theme.of(context)
                                .colorScheme
                                .secondaryContainer,
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

  void _saveForm(BuildContext context) async {
    setState(() {
      _isadded = true;
    });
    final snackBar = SnackBar(
      behavior: SnackBarBehavior.floating,
      content: Center(
        child: Text(
          'Fund has been Added',
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: Theme.of(context).colorScheme.primaryContainer),
        ),
      ),
    );
    _formKey.currentState!.save();
    await ref.read(loadedFundProvider.notifier).addFund(_loadedFund);
    _isadded = false;
    // _formKey.currentState!.reset();
    if (!context.mounted) return;
    Navigator.of(context).pop();
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    // Navigator.of(context).pop();
  }
}
