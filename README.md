# Text Input Pro

Flutter text input box with various validator like required validator, minimum char validator, maximum char validator, email validator and so on.

> The package is currently in the development phase 🐞

## Installing:
In your pubspec.yaml file add text_input_pro dependency.
```yaml
dependencies:
  text_input_pro: <latest_version>
```

Run pub get to get the dependencies.

```bash
flutter pub get
```

## Usage
The **TextInput** is a root widget and it will display **TextFormField** on the UI. It will automatically validate the user inputs and will react based on the validators.

```
body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextInput(
              TextEditingController(),
              "Text Input Example",
              validators: [
                RequiredValidator(errorText: "Required"),
                MinimumValidator(5, errorText: "Input is too short :("),
                MaximumValidator(30, errorText: "Input is too long :("),
              ],
            ),
          ],
        ),
      )
```

## Validators

| Name               | Description                                   | Arguments Description                                      |
|--------------------|-----------------------------------------------|-----------------------------------------------------------|
| RequiredValidator  | Checks if input is provided                  | `errorText` - Error message to display                    |
| MinimumValidator   | Ensures minimum characters are provided      | `min` - Minimum required length<br>`errorText` - Error message to display |
| MaximumValidator   | Ensures maximum characters are not exceeded  | `max` - Maximum allowed length<br>`errorText` - Error message to display |
| EmailValidator     | Validates if the input is a valid email      | `errorText` - Error message to display                    |
| RegExpValidator    | Checks if input matches a regular expression | `exp` - Regular Expression<br>`errorText` - Error message to display |
| NumOnlyValidator   | Ensures input contains only numbers          | `errorText` - Error message to display                    |
| LettersOnlyValidator | Ensures input contains only alphabets     | `errorText` - Error message to display                    |



## License
This project is licensed under the Apache License 2.0 - see the [LICENSE](LICENSE) file for details