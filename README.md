# BlendMask

BlendMask is a Flutter widget that allows you to apply blend modes and opacity to its child widget. This can be useful for creating various visual effects such as overlays, blending images, and achieving custom compositing effects in your Flutter applications.

## Features

- **Blend Modes:** Apply any of the supported blend modes to the child widget.
- **Opacity Control:** Adjust the opacity of the blend mask to achieve the desired level of transparency.
- **Easy to Use:** Simply wrap your widget with `BlendMask` and specify the blend mode and opacity.

## Installation

Add `blendmask` to your `pubspec.yaml`:

```yaml
dependencies:
  blendmask: ^0.0.1
```
## Usage

<img src="https://raw.githubusercontent.com/emrhnzngn/blendmask/main/example.png" alt="Example" height="200"/>
```dart
Stack(
      alignment: Alignment.center,
      children: [
        Image.network("https://images.dog.ceo/breeds/akita/Akita_Inu_dog.jpg"),
        Positioned(
          right: 0,
          top: 60,
          bottom: 60,
          child: BlendMask(
            blendMode: BlendMode.luminosity,
            child: Image.network(
                "https://images.dog.ceo/breeds/spaniel-irish/n02102973_634.jpg"),
          ),
        ),
        BlendMask(
          blendMode: BlendMode.overlay,
          child: Text(
            'HELLO WORLD!',
            style: Theme.of(context)
                .textTheme
                .headlineLarge!
                .copyWith(fontWeight: FontWeight.bold, fontSize: 52),
          ),
        ),
      ],
    )
```
