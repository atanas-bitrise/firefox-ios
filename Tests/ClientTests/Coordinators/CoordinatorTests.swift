// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/

import XCTest
@testable import Client

final class CoordinatorTests: XCTestCase {
    var navigationController: NavigationController!
    var router: MockRouter!

    override func setUp() {
        super.setUp()
        navigationController = MockNavigationController()
        router = MockRouter(navigationController: navigationController)
    }

    override func tearDown() {
        super.tearDown()
        navigationController = nil
        router = nil
    }

    func testAddChild() {
        let subject = BaseCoordinator(router: router)
        let child = BaseCoordinator(router: router)
        subject.add(child: child)

        XCTAssertEqual(subject.childCoordinators[0].id, child.id)
    }

    func testRemoveChild() {
        let subject = BaseCoordinator(router: router)
        let child = BaseCoordinator(router: router)
        subject.add(child: child)
        subject.remove(child: child)

        XCTAssertTrue(subject.childCoordinators.isEmpty)
    }
}
