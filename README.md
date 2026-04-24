# 📇 Employee 3D Flip Card
**An Interactive Flutter Profile UI with 3D Animation**

This project is a high-quality "Digital ID Card" built with Flutter. It features a custom 3D flip animation that allows users to tap the card to transition smoothly between a professional profile view and a detailed contact information side.

---

## 🛠️ Advanced Technical Features
* **3D Perspective Animation:** Utilizes `Matrix4` transformations to create a realistic sense of depth (`perspective`) during the rotation.
* **Custom Animation Controller:** Implements `AnimationController` and `Tween` with a `SingleTickerProviderStateMixin` for high-performance 60fps transitions.
* **Conditional Rendering:** Uses angle-based logic to swap between the front and back widgets exactly at the 90-degree mark of the rotation.
* **Modular UI Design:** Built with reusable helper widgets for contact rows and a clean, corporate color palette using the `Color.fromARGB` space.

---

## 🧩 Key Code Highlights
* **Flip Logic:** Managed via a `GestureDetector` that toggles the `AnimationController` state.
* **Mathematical Precision:** Uses the `dart:math` library to calculate exact pi-based rotations for the Y-axis.
* **State Management:** Efficiently handles the flip state to ensure the back-side text is correctly mirrored and readable.

---

## 📸 Project Showcase

| Front Side (Profile) | Back Side (Details) |
|---|---|
| <img src="<img width="388" height="896" alt="EmpCard1" src="https://github.com/user-attachments/assets/cd85696b-b2a7-487e-b540-4bfae8b72127" />
" width="300"> | <img src="<img width="393" height="893" alt="EmpCard2" src="https://github.com/user-attachments/assets/e5ec70e8-1fbb-4006-9d99-3fca102e0ba0" />
" width="300"> |

---

## 🚀 How to Run
1. Ensure you have Flutter installed on your machine.
2. Clone this repository:
   ```bash
   git clone [https://github.com/your-username/employee_card.git](https://github.com/your-username/employee_card.git)
