//
//  UIViewController+Flow.swift
//  Flow
//
//  Created by Carl Ekman on 2018-10-02.
//  Copyright © 2018 iZettle. All rights reserved.
//

import UIKit

public final class FlowViewController: UIViewController {
    private var viewDidLoadSignal = WriteSignal<()>()

    private var viewWillAppearSignal = WriteSignal<Bool>()
    private var viewDidAppearSignal = WriteSignal<Bool>()

    private var viewWillDisappearSignal = WriteSignal<Bool>()
    private var viewDidDisappearSignal = WriteSignal<Bool>()

    private var viewWillLayoutSubviewsSignal = WriteSignal<()>()
    private var viewDidLayoutSubviewsSignal = WriteSignal<()>()

    private var didReceiveMemoryWarningSignal = WriteSignal<()>()
    private var stateSignal = WriteSignal<UIApplicationState>()
}

extension FlowViewController {
    override public func viewDidLoad() {
        super.viewDidLoad()
        viewDidLoadSignal.emit()
    }

    override public func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewWillAppearSignal.emit(animated)
    }

    override public func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewDidAppearSignal.emit(animated)
    }

    override public func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        viewWillDisappearSignal.emit(animated)
    }

    override public func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        viewDidDisappearSignal.emit(animated)
    }

    override public func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        viewWillLayoutSubviewsSignal.emit()
    }

    override public func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        viewDidLayoutSubviewsSignal.emit()
    }

    override public func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        didReceiveMemoryWarningSignal.emit()
    }
}

extension FlowViewController {
    public var didLoad: Signal<()> {
        return viewDidLoadSignal.plain()
    }

    public var willAppear: Signal<Bool> {
        return viewWillAppearSignal.plain()
    }

    public var didAppear: Signal<Bool> {
        return viewDidAppearSignal.plain()
    }

    public var willDisappear: Signal<Bool> {
        return viewWillDisappearSignal.plain()
    }

    public var didDisappear: Signal<Bool> {
        return viewDidDisappearSignal.plain()
    }

    public var willLayoutSubviews: Signal<()> {
        return viewWillLayoutSubviewsSignal.plain()
    }

    public var didLayoutSubviews: Signal<()> {
        return viewDidLayoutSubviewsSignal.plain()
    }

    public var receivedMemoryWarning: Signal<()> {
        return didReceiveMemoryWarningSignal.plain()
    }
}
