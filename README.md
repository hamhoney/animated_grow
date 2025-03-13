# animated_grow
AnimatedGrow - Widgets can be easily moved.

|GrowIn|GrowOut|
|-|-|
|<img src="https://github.com/user-attachments/assets/3aab7800-5513-4324-a0e7-ffef2c5f5528" alt="GrowIn"  width="320">|<img src="https://github.com/user-attachments/assets/ec587eec-34e4-4717-8b3b-e346ec218bd6" alt="GrowOut" width="320">|
|<img src="https://github.com/user-attachments/assets/44b58bf6-2319-42a6-bdb3-82aca69890fc" alt="GrowInFixed"  width="320">|<img src="https://github.com/user-attachments/assets/aa9637a5-0c63-4dcc-a5c9-3fb0032b8094" alt="GrowOut" width="320">|

<br/>

## Getting Started
- [GrowIn](#growin)
- [GrowOut](#growout)
- [GrowController](#growcontroller)
- [Collapsed](#collapsed-widget)
- [Fixed](#fixed-child-widget)

<br/>

## Parameter
| name            | required           | type                  | default                       |
|-----------------|--------------------|-----------------------|-------------------------------|
| onEnd           | :x:                | `VoidCallback`        | :x:                           |
| controller      | :x:                | `AnimationController` | :x:                           |
| direction       | :heavy_check_mark: | `GrowDirection`       | :x:                           |
| autoStart       | :x:                | `bool`                | `true`                        |
| delay           | :x:                | `Duration`            | `Duration.zero`               |
| duration        | :x:                | `Duration`            | `Duration(milliseconds: 850)` |
| reverseDuration | :x:                | `Duration`            | `duration`                    |
| curve           | :x:                | `Curve`               | `Curves.linear`               |
| collapsed       | :x:                | `bool`                | `true`                        |
| fixed           | :x:                | `bool`                | `false`                       |
| from            | :x:                | `double`              | `0.0`                         |
| child           | :heavy_check_mark: | `Widget`              | :x:                           | 

<br/>

### GrowIn
```dart
GrowIn(
  direction: GrowDirection.leftToRight,
  child: ..
)
```

### GrowOut
```dart
GrowOut(
  direction: GrowDirection.rightToLeft,
  child: ..
)
```

### GrowController
```dart
AnimationController? controller;

GrowIn(
  controller: (growController) => controller = growController;
  direction: GrowDirection.leftToRight,
  child: ..
)
```

### Collapsed widget
- true: collapsed widget(default)
- false: not widget

```dart
GrowIn(
  direction: GrowDirection.leftToRight,
  collapsed: false,
  child: ..
)
```

### Fixed child widget
- true: fixed child widget
- false: not fixed child widget(default)

```dart
GrowIn(
  direction: GrowDirection.leftToRight,
  fixed: true,
  child: ..
)
```