//
//  ContentView.swift
//  ImageLoadingView
//
//  Created by James Cosgrove on 24/04/2020.
//  Copyright © 2020 James Cosgrove. All rights reserved.
//

import SwiftUI





struct ContentView: View {
	var body: some View {
		LoadingView(icons: ["test"])
	}
}

struct LoadingView: View {
	let timer = Timer.publish(every: 1.5, on: .main, in: .common).autoconnect()
	@State var icons: [String]
	@State var yOffset = 100
	@State var opacity = 0
    var body: some View {
		Image(icons[0])
			.offset(x: 0, y: CGFloat(yOffset))
			.opacity(Double(opacity))
			.font(.system(size: 50))
			.onReceive(timer) { _ in
				self.animate()
			}
		.animation(.easeInOut(duration: 1))
    }
	func animate() {
		if self.yOffset == 100 {
			self.setParams(offset: 0, opacity: 1)
		}
		else if self.yOffset == 0 {
			self.setParams(offset: -100, opacity: 0)
		}
		else {
			self.setParams(offset: 100, opacity: 0)
			self.nextIcon()
		}
	}
	func setParams(offset: Int, opacity: Int) {
		self.yOffset = offset
		self.opacity = opacity
	}
	func nextIcon() {
		let move = self.icons[0]
		self.icons.remove(at: 0)
		self.icons.append(move)
	}
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
