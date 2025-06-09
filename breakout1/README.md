## 🚀 Activity 1: Implicitly Animated Widget (`AnimatedContainer`)

### 📋 **Overview**
This project demonstrates the use of Flutter’s `AnimatedContainer` to create smooth transitions between widget property changes — like size and color — without using complex animation controllers. It's a simple and powerful way to make your UI more interactive and visually appealing.

---

### 🎯 **Objective**
Simulate a responsive container that animates when tapped:
- Changes its **size** and **color**.
- Gives the user **visual feedback** through smooth transitions.

---

### 🧠 **Concept**
Flutter's *implicit animations* are widgets that animate changes to their properties over time.  
`AnimatedContainer` listens for changes in values like `width`, `height`, `color`, etc., and animates them smoothly.

---

### 🛠️ **Tools & Tech**
- Flutter SDK
- Dart Programming Language
- Android Studio / VS Code / Any IDE

---

### 📱 **Real-World Use Case**
You can use `AnimatedContainer` to:
- Animate buttons when tapped
- Indicate loading or processing
- Visually highlight content changes
- Add polish to form inputs or transitions

---

### 🏗️ **Implementation Steps**

1. **Create a new Stateful Widget** called `ImplicitAnimationScreen`.
2. **Use a Scaffold** to provide structure (AppBar + body).
3. **Add an `AnimatedContainer`** inside a `GestureDetector` to make it tappable.
4. **Define three variables**:
   - `_width`
   - `_height`
   - `_color`
5. **On tap**, toggle the values to animate the container.

---

### 🧪 **Behavior**
- Tap the container → It grows and changes color.
- Tap again → It returns to original size and color.
- Animations happen **automatically** over 1 second.

---

### 🎨 **Features**
- Smooth size transition from 100 to 200 pixels.
- Color transitions from blue to red and vice versa.
- No need for manual animation controllers.
- Easy to extend (e.g. add border radius, shadows, etc.)

---

### 📦 **How to Run**
1. Clone or download the project.
2. Open it in your Flutter-supported IDE.
3. Run `flutter pub get` if needed.
4. Launch the app on an emulator or device.
5. Tap the container to see the animation in action!

---

### ✨ **Screenshots** (Optional)
_Add a screenshot here if needed, showing the container before and after the tap._

---

### 🔁 **Next Ideas**
- Add border radius animation.
- Use `AnimatedOpacity` or `AnimatedAlign`.
- Combine multiple animated widgets for a full-screen interaction.
