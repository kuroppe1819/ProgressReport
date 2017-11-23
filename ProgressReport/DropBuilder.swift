//
// Created by kuroppe on 2017/11/19.
// Copyright (c) 2017 kuroppe. All rights reserved.
//

import Cocoa

struct DropBuilder {
    func build() -> NSViewController {
        let storyboard = NSStoryboard(name: NSStoryboard.Name(rawValue: "Main"), bundle: nil)
        let viewController = storyboard.instantiateController(withIdentifier: NSStoryboard.SceneIdentifier(rawValue: "Drop")) as! DropViewController
        let repository = DropViewRepository(httpClient: HttpClient())
        let useCase = DropViewUseCase(dropRepository: repository)
        let presenter = DropViewPresenter(dropViewInput: viewController, dropUseCase: useCase)
        viewController.inject(dropPresenter: presenter)
        return viewController
    }
    
    func postTextBuilder() -> DropViewUseCase {
        let repository = DropViewRepository(httpClient: HttpClient())
        return DropViewUseCase(dropRepository: repository)
    }
}
