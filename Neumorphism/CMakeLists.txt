cmake_minimum_required(VERSION 3.24.0)

find_package(QT NAMES Qt6 Qt5)
find_package(Qt${QT_VERSION_MAJOR} COMPONENTS Core ShaderTools)

set_source_files_properties(
    Neumorphism.qml
    PROPERTIES
        QT_QML_SINGLETON_TYPE TRUE
)

qt_add_qml_module(neumorphism
    URI Neumorphism
    VERSION 1.0
    QML_FILES
        Base/AdvancedRectangle.qml
        Base/Border.qml
        Base/BoxShadow.qml
        Base/DashedRect.qml
        Base/DashedRing.qml
        Base/FastShadow.qml
        Base/GradientColor.qml
        Base/Handler.qml
        Base/NeumorphismView.qml
        Base/RoundedInEffect.qml
        Base/RoundedOutEffect.qml
        Base/Shadow.qml
        Base/Wave.qml
        Base/NeumorphismRoundedRectangle.qml

        Neumorphism.qml

        BusyIndicator.qml
        Button.qml
        CheckBox.qml
        ComboBox.qml
        Dial.qml
        Frame.qml
        HorizontalSeprator.qml
        Label.qml
        ProgressBar.qml
        RadioButton.qml
        RangeSlider.qml
        Slider.qml
        SpinBox.qml
        SplitView.qml
        StackView.qml
        Switch.qml
        TextArea.qml
        TextField.qml
        Tumbler.qml
)

qt_add_shaders(neumorphism "neumorphism-shaders"
    BATCHABLE
    PRECOMPILE
    OPTIMIZED
    PREFIX
        "/Neumorphism/"
    FILES
        Shaders/round-out-effect.frag
        Shaders/round-in-effect.frag
        Shaders/advanced-rectangle.frag
        Shaders/box-shadow.frag
        Shaders/dashed-rectangle.frag
        Shaders/dashed-ring.frag
        Shaders/fast-shadow-blur-vertext.vert
        Shaders/fast-shadow-blur-fragment.frag
        Shaders/fast-shadow-weight.frag
)
