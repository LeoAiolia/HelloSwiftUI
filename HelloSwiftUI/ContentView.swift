//
//  ContentView.swift
//  HelloSwiftUI
//
//  Created by dev-yxr on 2021/11/27.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("basic")) {
                    NavigationLink(destination: TextView()) {
                        PageRow(title: "Text", subTitle: "Hello Text")
                    }
                    NavigationLink(destination: RichTextView()) {
                        PageRow(title: "RichText", subTitle: "Hello RichText")
                    }
                    NavigationLink(destination: LabelView()) {
                        PageRow(title: "Label", subTitle: "Hello Label")
                    }
                    NavigationLink(destination: TextFieldView()) {
                        PageRow(title: "TextField", subTitle: "Hello TextField")
                    }
                    NavigationLink(destination: ImageListView()) {
                        PageRow(title: "Image", subTitle: "Hello Image")
                    }
                    NavigationLink(destination: ButtonView()) {
                        PageRow(title: "Button", subTitle: "Hello Button")
                    }
                    NavigationLink(destination: ToolbarView()) {
                        PageRow(title: "ToolBar", subTitle: "Hello ToolBar")
                    }
                    NavigationLink(destination: PickView()) {
                        PageRow(title: "Picker", subTitle: "选择器")
                    }
                    NavigationLink(destination: IndicatorView()) {
                        PageRow(title: "indicatorView", subTitle: "指示器")
                    }
                }
                
                Section(header: Text("自定义")) {
                    NavigationLink(destination: CustomModifierView()) {
                        PageRow(title: "自定义Modifier", subTitle: nil)
                    }
                    NavigationLink(destination: UIKitView()) {
                        PageRow(title: "使用UIKit控件", subTitle: nil)
                    }
                    NavigationLink(destination: PropertyWrapperView()) {
                        PageRow(title: "属性包装", subTitle: nil)
                    }
                    NavigationLink(destination: AlertView()) {
                        PageRow(title: "alert", subTitle: "还有actionsheet")
                    }
                    NavigationLink(destination: GridView()) {
                        PageRow(title: "GrideView", subTitle: nil)
                    }
                    NavigationLink(destination: ListView()) {
                        PageRow(title: "ListView", subTitle: nil)
                    }
                    NavigationLink(destination: GroupView()) {
                        PageRow(title: "容器", subTitle: "Form Group GroupBox Section ControlGroup")
                    }
                    NavigationLink(destination: OutlineGroupView()) {
                        PageRow(title: "OutlineGroup", subTitle: "outlineGroup")
                    }
                    NavigationLink(destination: SafeAreaView()) {
                        PageRow(title: "SafeAreaView", subTitle: "")
                    }
                }
            }.listStyle(GroupedListStyle())
                .navigationBarTitle(Text("Example"), displayMode: .large)
                .navigationBarItems(trailing: Button(action: {
                    print("Tap")
                }, label: {
                    Text("Right").foregroundColor(.orange)
                }))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
