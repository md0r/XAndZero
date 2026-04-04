//  XAndZero
//
//  Created by Mihai Dorhan on 02.04.2026.
//

import SwiftUI

extension View {
  func infinityFrame() -> some View {
    self
      .frame(maxWidth: .infinity, maxHeight: .infinity)
  }
}
