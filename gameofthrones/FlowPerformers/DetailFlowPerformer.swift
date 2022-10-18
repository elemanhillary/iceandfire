//
//  DetailFlowPerformer.swift
//  gameofthrones
//
//  Created by MacBook Pro on 10/16/22.
//

import Foundation
import UIKit

class DetailFlowPerformer: FlowPerformerProtocol {
    typealias FlowStep = DetailFlow.FlowStep
    typealias FlowState = DetailFlow.FlowState
    
    private let navigationController: UINavigationController
    private let flowRunner: FlowRunnerProtocol
    private let repository: GetHouseRepository
    
    init(navigationController: UINavigationController, flowRunner: FlowRunnerProtocol, repository: GetHouseRepository) {
        self.navigationController = navigationController
        self.flowRunner = flowRunner
        self.repository = repository
    }
    
    func perform(step: DetailFlow.FlowStep, completion: @escaping (DetailFlow.FlowState.UpdateAction) -> Void) {
        switch step {
        case let .showScreen(houseUrl):
            let detailViewModel = HouseDetailViewModel(houseUrl: houseUrl, repository: repository)
            let detailViewController = HomeDetailViewController(viewModel: detailViewModel)
            DispatchQueue.main.async {
                self.navigationController.present(detailViewController, animated: true)
            }
            completion(.screenShow)
        }
    }
}
