# Cymbalki

Minimalistic music app for kids.

![Example1](/screenshots/1.png?raw=true)

### Troubleshooting

#### Phase script execution failed with non-zero code

* First, close XCode and delete `Podfile.lock`, `Pods` directory, `xcworkspace`.
Then, run `pod install` and reopen the project. Don't forget to re-adjust iOS target to iOS 14.

* Go to `Pods/Target Support Files/Pods-Cymbalki/Pods-Cymbalki-frameworks`, line 44.
Change `source="$(readlink "${source}")"` to `source="$(readlink -f "${source}")"`

#### SDK does not contain libarclite at the path

* Go to pods configuration, make it available to iOS 14 everywhere
