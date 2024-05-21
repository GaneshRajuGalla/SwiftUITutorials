//
//  TextAndImageSegmentView.swift
//  SwiftUITutorials
//
//  Created by Ganesh Raju Galla on 20/05/24.
//

import SwiftUI
typealias CellInfo = (imageName: String, title: String)

struct TextAndImageSegmentView: View {
    
    // MARK: - Properties
    @State var selection:Int = 0
    
    // MARK: - Body
    var body: some View {
        Picker("", selection: $selection) {
            CustomSegmentedPicker(cells: [CellInfo(imageName:"sun.max.fill", title: "Morning"), CellInfo(imageName: "moon.fill", title: "Night")],selection: $selection)
        }
        .pickerStyle(.segmented)
    }
}


#if DEBUG
#Preview {
    TextAndImageSegmentView()
        .preferredColorScheme(.dark)
}
#endif

struct CustomSegmentedPicker: View {
    var cells: [CellInfo]
    var cellSize: CGSize = CGSizeMake(80, 32)
    var stackAxis: Axis = .horizontal
    var cellButtonCornerRadius: CGFloat = 8
    var verticalPadding: CGFloat = 3
    @Binding var selection: Int
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: cellButtonCornerRadius)
                .fill(.white)
                .frame(width: cellSize.width, height: cellSize.height)
                .offset(x: (CGFloat(selection) - CGFloat(cells.count)/2 + 0.5) * cellSize.width, y: 0)
            HStack(spacing: 0){
                ForEach(cells.indices, id: \.self) { cellIndex in
                    let cellInfo = cells[cellIndex]
                    CellButton(cellInfo: cellInfo)
                    .frame(width: cellSize.width, height: cellSize.height)
                    .clipShape(RoundedRectangle(cornerRadius: cellButtonCornerRadius))
                    .onTapGesture {
                        withAnimation {
                            self.selection = cellIndex
                        }
                    }
                    if cellIndex != cells.index(before: cells.endIndex) {
                        Divider()
                            .frame(height: cellSize.height * 0.8)
                    }

                }
            }
            .padding(3)
            .background(.black.opacity(0.05))
            .clipShape(RoundedRectangle(cornerRadius: cellButtonCornerRadius))
        }
    }
    
    @ViewBuilder
    func CellButton(cellInfo: CellInfo) -> some View {
        if stackAxis == .horizontal {
            HStack {
                Image(systemName: cellInfo.imageName)
                Text(cellInfo.title)
                    .font(.footnote)
            }
        }
        else {
            VStack(spacing: verticalPadding) {
                Image(systemName: cellInfo.imageName)
                    .font(.title2)
                    .fontWeight(.light)
                Text(cellInfo.title)
                    .font(.caption2)
            }
        }
    }
}
