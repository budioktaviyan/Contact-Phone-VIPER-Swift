//
//  ContactCreateOrUpdateTableViewCell.swift
//  Contacts
//
//  Created by Ari Munandar on 4/24/17.
//  Copyright (c) 2017 Ari Munandar. All rights reserved.
//
//  This file was generated by the Devcast Studio XCode Templates
//	Name		: Ari Muandnar
//	E-Mail		: arimunandar.dev@gmail.com
// 	Instagram	: _arymunandar_
// 	Youtube		: https://www.youtube.com/channel/UC7jr8DR06tcVR0QKKl6cSNA
//

import UIKit
import EasyPeasy

class ContactCreateOrUpdateTableViewCell: BaseTableCell {

    var delegate: ContactCreateOrUpdateViewComponent?

    // MARK - Initial Label
    var titleLabel: UILabel = {
        let label = UILabel()
        label.text = NSLocalizedString("Title", comment: "")
        label.textColor = Colors.MID_GREY
        label.backgroundColor = Colors.CLEAR
        label.font = UIFont(name: "SanFranciscoText-Regular", size: FontSize.LARGE)
        label.textAlignment = .right
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.sizeToFit()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var inputTextField: UITextField = {
        let field = UITextField()
        field.delegate = self
        field.tintColor = Colors.DARK_GREY
        field.textColor = Colors.DARK_GREY
        field.addTarget(self, action: #selector(textFiledDidChangeValue), for: .editingChanged)
        return field
    }()

    var setTitle: String? {
        didSet {
            guard let title = setTitle else {
                return
            }

            self.titleLabel.text = title
        }
    }

    // MARK - Setup Selection Cell
    override var isSelected: Bool {
        didSet {
            if isSelected {
                // Do someting...
            } else {
                // Do someting...
            }
        }
    }

    var setTag: Int? {
        didSet {
            guard let tag = setTag else {
                return
            }
            self.inputTextField.tag = tag
        }
    }

    // MARK - Lifecycle
    override func setupViews() {
        super.setupViews()

        // MARK: - Call Setup Properties
        setupProperties()

        // MARK - Call Setup Cell function
        setupComponent()

        // MARK - Call Setup Cell Frame
        setupFrame()

    }

}

// MARK - Setup Component View
extension ContactCreateOrUpdateTableViewCell {

    // MARK: - Setup P{roperties
    func setupProperties() {
        self.setupGeneral(separatorWidth: Padding._16)
    }

    // MARK - Setup Cell Component
    func setupComponent() {
        self.addSubview(self.titleLabel)
        self.addSubview(self.inputTextField)
    }

    // MARK - Setup Cell frame
    func setupFrame() {
        self.titleLabel <- [
            Top(Sizes._20),
            Left(Padding._24),
            Width(Sizes._80),
            Bottom(Sizes._20)
        ]

        self.inputTextField <- [
            CenterY(),
            Left(Padding._32).to(self.titleLabel),
            Right(Padding._16),
            Height(Sizes._40)
        ]
    }

}

// MARK - Setup Component View
extension ContactCreateOrUpdateTableViewCell: UITextFieldDelegate {

    func textFieldDidBeginEditing(_ textField: UITextField) {
        switch textField.tag {
        case 2:
            textField.text = "+"
        default:
            break
        }
    }

    func textFiledDidChangeValue(_ textField: UITextField) {
        switch textField.tag {
        case 0:
            guard let value = textField.text else {
                return
            }
            self.delegate?.requestUpdate.firstName = value
        case 1:
            guard let value = textField.text else {
                return
            }
            self.delegate?.requestUpdate.lastName = value
        case 2:
            guard let value = textField.text else {
                return
            }
            self.delegate?.requestUpdate.phoneNumber = value
        case 3:
            guard let value = textField.text else {
                return
            }
            self.delegate?.requestUpdate.email = value.lowercased()
        default:
            break
        }
    }

}
