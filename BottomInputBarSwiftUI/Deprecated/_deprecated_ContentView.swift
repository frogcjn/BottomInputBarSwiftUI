//
//  ContentView.swift
//  BottomInputBarSwiftUI
//
//  Created by Cao, Jiannan on 1/9/24.
//

import SwiftUI
import SwiftUIIntrospect
/*
struct MyBottomBar: View {
    var body: some View {
        TextField("123", text: .constant("123"))
            .textFieldStyle(.roundedBorder)
            .introspect(.textField, on: .iOS(.v17)) {
                $0.inputAccessoryView = nil
            }
            .padding()
    }
}

struct ContentView: View {
    
    // let layoutGuide = UIKeyboardLayoutGuide()
    
    //let bottomBar = UIBottomBar(content: MyBottomBar())
    
    var body: some View {
        NavigationStack {
            List {
                TextField("123", text: .constant("123"))
                    .introspect(.textField, on: .iOS(.v17)) {
                        $0.inputAccessoryView = nil
                    }
                ForEach(Array(1..<20), id: \.self) {
                    Text("\($0)")
                }
            }
            

            
            //ignoresSafeArea(.keyboard, edges: .bottom)
            .scrollDismissesKeyboard(.interactively)
            .navigationTitle("Title")
            .navigationBarTitleDisplayMode(.inline)
            /*.toolbar {
                ToolbarItem(placement: .keyboard) {
                    Text("底部状态条")
                        .font(.title3)
                        .foregroundColor(.indigo)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 40)
                        .padding()
                        .background(.green.opacity(0.6))
                }
            }*/
            .safeAreaInset(edge: .bottom) {
                MyBottomBar().hidden() // KeyboardLayoutGuide().background(.thinMaterial)
            }
            //.safeAreaPadding(.bottom, 34+16)
        }
        .introspect(.viewController, on: .iOS(.v17)) {
            struct Holder {
                static let bottomBar = UIBottomBar(content: _UIHostingView(rootView: MyBottomBar()))
            }
            $0.view.addSubview(Holder.bottomBar)
        }
        /*.safeAreaInset(edge: .bottom) {
            KeyboardLayoutGuide().background(.thinMaterial)
        }*/
        
        /*.overlay {
            BottomBar().allowsHitTesting(true)
        }*/
        /*.introspect(.viewController, on: .iOS(.v17)) {
            $0.view.addSubview(layoutGuide)
        }*/
        
        /*.overlay {
            BottomBar()
                .background(.regularMaterial)
                //.frame(maxHeight: .infinity)
        }*/
    }
}

#Preview {
    ContentView()
}
*/
