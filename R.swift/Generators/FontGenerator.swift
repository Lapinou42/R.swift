//
//  Font.swift
//  R.swift
//
//  Created by Mathijs Kadijk on 10-12-15.
//  Copyright © 2015 Mathijs Kadijk. All rights reserved.
//

import Foundation

struct FontGenerator: Generator {
  let externalStruct: Struct?
  let internalStruct: Struct? = nil

  init(fonts: [Font]) {
    externalStruct = Struct(
      type: Type(module: .Host, name: "font"),
      implements: [],
      typealiasses: [],
      vars: [],
      functions: fonts.map(FontGenerator.fontFunctionFromFont),
      structs: []
    )
  }

  private static func fontFunctionFromFont(font: Font) -> Function {
    return Function(
      isStatic: true,
      name: font.name,
      generics: nil,
      parameters: [
        Function.Parameter(name: "size", localName: "size", type: Type._CGFloat)
      ],
      doesThrow: false,
      returnType: Type._UIFont.asOptional(),
      body: "return UIFont(name: \"\(font.name)\", size: size)"
    )
  }
}
