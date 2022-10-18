//
//  DetailFlowPerformer.swift
//  gameofthrones
//
//  Created by MacBook Pro on 10/16/22.
//

import Foundation
import UIKit

class HomeFlowPerformer: FlowPerformerProtocol {
    typealias FlowStep = HomeFlow.FlowStep
    typealias FlowState = HomeFlow.FlowState
    
    private let parentView: CardHolderViewControllerProtocol
    private let flowRunner: FlowRunnerProtocol
    private let repository: GetHousesRepositoryProtocol
    
    init(parentView: CardHolderViewControllerProtocol, flowRunner: FlowRunnerProtocol, repository: GetHousesRepositoryProtocol) {
        self.parentView = parentView
        self.flowRunner = flowRunner
        self.repository = repository
    }
    
    func perform(step: HomeFlow.FlowStep, completion: @escaping (HomeFlow.FlowState.UpdateAction) -> Void) {
        switch step {
        case let .showScreen(apiUrl):
            let homeViewModel = HousesViewModel(apiUrl: apiUrl, repository: repository, requestAction: { action in
                switch action {
                case let .showHouse(houseUrl):
                    self.flowRunner.runDetailFlow(navigationController: self.parentView.navigationController ?? UINavigationController(), houseUrl: houseUrl)
                }
            })
            let homeViewController = HousesViewController(viewModel: homeViewModel)
            self.parentView.setCard1ChildViewController(homeViewController)
            completion(.screenShow)
        }
    }
}
