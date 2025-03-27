# animated_grow
AnimatedGrow - Widgets can be easily moved.

|GrowIn|GrowOut|
|-|-|
|<img src="https://github.com/user-attachments/assets/3aab7800-5513-4324-a0e7-ffef2c5f5528" alt="GrowIn"  width="320">|<img src="https://github.com/user-attachments/assets/ec587eec-34e4-4717-8b3b-e346ec218bd6" alt="GrowOut" width="320">|

<br/>

## Getting Started
- [GrowIn](#growin)
- [GrowOut](#growout)
- [GrowController](#growcontroller)
- [AutoStart](#autostart-animation)
- [Collapsed](#collapsed-widget)
- [Fixed](#fixed-child-widget)

<br/>

## Parameters
| name            | required           | type                  | default                       |
|-----------------|--------------------|-----------------------|-------------------------------|
| onEnd           | :x:                | `VoidCallback`        |                               |
| controller      | :x:                | `AnimationController` |                               |
| direction       | :heavy_check_mark: | `GrowDirection`       |                               |
| autoStart       | :x:                | `bool`                | `true`                        |
| delay           | :x:                | `Duration`            | `Duration.zero`               |
| duration        | :x:                | `Duration`            | `Duration(milliseconds: 850)` |
| reverseDuration | :x:                | `Duration`            | `duration`                    |
| curve           | :x:                | `Curve`               | `Curves.linear`               |
| collapsed       | :x:                | `bool`                | `true`                        |
| fixed           | :x:                | `bool`                | `false`                       |
| from            | :x:                | `double`              | `0.0`                         |
| child           | :heavy_check_mark: | `Widget`              |                               | 

<br/>

### GrowIn
```dart
GrowIn(
  direction: GrowDirection.leftToRight,
  child: ..
)
```
<br/>

### GrowOut
```dart
GrowOut(
  direction: GrowDirection.rightToLeft,
  child: ..
)
```
<br/>

### GrowController
```dart
AnimationController? controller;

GrowIn(
  controller: (growController) => controller = growController;
  direction: GrowDirection.leftToRight,
  child: ..
)
```
<br/>


### AutoStart Animation
- if you want to control animation, define `false` into `autoStart` parameter.
- Its default value is `true`.

```dart
GrowIn(
  autoStart: false,
  direction: GrowDirection.leftToRight,
  child: ..
)
```

<br/>

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


| | vertical | horizontal |
|-|-|-|
| `collapsed: true`</br>(default) | <img src="https://github.com/user-attachments/assets/624b1607-72bc-4074-b201-33b8b4f9352d" alt="GrowInVerticalCollapsed-true"  width="280"> | <img src="https://github.com/user-attachments/assets/40c1a902-acff-4913-8bcb-fb6be357be55" alt="GrowInHorizontalCollapsed-true"  width="280"> |
| `collapsed: false` | <img src="https://github.com/user-attachments/assets/49f1b09b-67a0-4338-aa86-69fc9a4b2f96" alt="GrowInVerticalCollapsed-false" width="280"> | <img src="https://github.com/user-attachments/assets/865bb560-60e6-48ee-bae2-c8f62acc5f27" alt="GrowInHorizontalCollapsed-false" width="280"> |

<br/>

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
||GrowIn|GrowOut|
|-|-|-|
| `fixed: false`<br/>(default) |<img src="https://github.com/user-attachments/assets/3aab7800-5513-4324-a0e7-ffef2c5f5528" alt="GrowIn"  width="320">|<img src="https://github.com/user-attachments/assets/ec587eec-34e4-4717-8b3b-e346ec218bd6" alt="GrowOut" width="320">|
| `fixed: true` |<img src="https://github.com/user-attachments/assets/44b58bf6-2319-42a6-bdb3-82aca69890fc" alt="GrowInFixed"  width="320">|<img src="https://github.com/user-attachments/assets/aa9637a5-0c63-4dcc-a5c9-3fb0032b8094" alt="GrowOut" width="320">|
