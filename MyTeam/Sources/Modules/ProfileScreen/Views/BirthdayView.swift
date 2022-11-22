//
//  BirthdayView.swift
//  MyTeam
//
//  Created by User on 22.11.2022.
//

import UIKit

class BirthView: BaseView {

    // MARK: - Outlets

    private let birthView: UIView = {
        let view = UIView(frame: CGRect(
            x: 0,
            y: 0,
            width: UIScreen.main.bounds.width,
            height: 73.5)
        )
        return view
    }()

    private let starImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "star")
        view.layer.borderWidth = 0
        return view
    }()

    private let birthDataLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Inter-Medium", size: 16)
        return label
    }()

    private let yearsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Inter-Medium", size: 16)
        return label
    }()

    private let dividingLine: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = UIColor(red: 247/255, green: 247/255, blue: 248/255, alpha: 1)
        return view
    }()

    // MARK: - Lifecycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupHierarchy()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //MARK: - Setups

    private func setupHierarchy() {
        addSubview(birthView)
        addSubview(starImageView)
        addSubview(birthDataLabel)
        addSubview(yearsLabel)
        addSubview(dividingLine)
    }

    private func setupLayout() {
        starImageView.snp.makeConstraints { make in
            make.centerY.equalTo(birthView.snp.centerY)
            make.leading.equalTo(self.snp.leading).offset(20)
        }

        birthDataLabel.snp.makeConstraints { make in
            make.centerY.equalTo(starImageView.snp.centerY)
            make.leading.equalTo(starImageView.snp.trailing).offset(14)
        }

        yearsLabel.snp.makeConstraints { make in
            make.centerY.equalTo(starImageView.snp.centerY)
            make.trailing.equalTo(birthView.snp.trailing).offset(-20)
        }

        dividingLine.snp.makeConstraints { make in
            make.top.equalTo(yearsLabel.snp.bottom).offset(27.5)
            make.leading.equalTo(self.snp.leading).offset(16)
            make.trailing.equalTo(self.snp.trailing).offset(-16)
            make.width.equalTo(UIScreen.main.bounds.size.width - 32.0)
            make.height.equalTo(0.5)
        }
    }

    // MARK: - Methods

    func setData(dateBirth: String, years: String) {
        self.birthDataLabel.text = "\(dateBirth)"
        self.yearsLabel.text = "\(years)"
    }
}
