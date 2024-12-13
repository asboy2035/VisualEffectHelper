//
//  ContentView.swift
//  VisualEffectHelper
//
//  Created by ash on 12/13/24.
//

import SwiftUI

struct ResponsiveGridView: View {
    let items: [(String, NSVisualEffectView.Material)] = [
        ("Sidebar (this window)", .sidebar),
        ("Full Screen UI", .fullScreenUI),
        ("Header View", .headerView),
        ("Sheet", .sheet),
        ("Window Background", .windowBackground),
        ("HUD Window", .hudWindow),
        ("Popover", .popover),
        ("Menu", .menu),
        ("Tooltip", .toolTip),
        ("Content Background", .contentBackground),
        ("Under Window Background", .underWindowBackground),
        ("Under Page Background", .underPageBackground)
    ]

    var body: some View {
        ZStack {
            VisualEffectView(material: .sidebar, blendingMode: .behindWindow)
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 20) {
                Text("VisualEffectHelper")
                    .font(.system(size: 24, weight: .bold, design: .monospaced))
//                Text("This window: .sidebar")
                
                GeometryReader { geometry in
                    // Calculate the number of columns dynamically based on window size
                    let columns = max(Int(geometry.size.width / 430), 1) // Minimum 220 per item
                    let gridLayout = Array(repeating: GridItem(.flexible(), spacing: 20), count: columns)
                    
                    ScrollView {
                        LazyVGrid(columns: gridLayout, spacing: 20) {
                            ForEach(items, id: \.0) { item in
                                ZStack {
                                    //                        HStack(spacing: 10) {
                                    VisualEffectView(material: item.1, blendingMode: .behindWindow)
                                        .frame(width: 400, height: 200)
                                    Text(item.0)
                                        .padding()
                                        .font(.system(size: 16, weight: .medium, design: .monospaced))
                                }
                                //                        .background(content: { Color.black.opacity(0.1) })
//                                .border(Color.accentColor, width: 2)
                                .cornerRadius(40)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 40)
                                        .stroke(Color.accentColor, lineWidth: 5) // Rounded border with accent color
                                )
                                .padding(10)
                            }
                        }
                        .padding()
                    }
                }
                .edgesIgnoringSafeArea(.all)
            }
        }
    }
}

#Preview {
    ResponsiveGridView()
}

struct VisualEffectView: NSViewRepresentable {
    let material: NSVisualEffectView.Material
    let blendingMode: NSVisualEffectView.BlendingMode
    
    func makeNSView(context: Context) -> NSVisualEffectView {
        let view = NSVisualEffectView()
        view.material = material
        view.blendingMode = blendingMode
        view.state = .active
        return view
    }
    
    func updateNSView(_ nsView: NSVisualEffectView, context: Context) {
        nsView.material = material
        nsView.blendingMode = blendingMode
    }
}
