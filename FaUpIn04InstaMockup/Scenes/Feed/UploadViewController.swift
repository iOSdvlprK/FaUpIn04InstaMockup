//
//  UploadViewController.swift
//  FaUpIn04InstaMockup
//
//  Created by joe on 5/15/24.
//

import UIKit
import SnapKit

final class UploadViewController: UIViewController {
    private let uploadImage: UIImage
    
    private let imageView = UIImageView()
    
    private lazy var textView: UITextView = {
        let textView = UITextView()
        textView.text = "Input text..."
        textView.textColor = .secondaryLabel
        textView.font = .systemFont(ofSize: 15.0)
        textView.delegate = self
        return textView
    }()
    
    init(uploadImage: UIImage) {
        self.uploadImage = uploadImage
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        setupNavigationItem()
        setupLayout()
        
        imageView.image = uploadImage
    }
}

extension UploadViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        guard textView.textColor == .secondaryLabel else { return }
        
        textView.text = nil
        textView.textColor = .label
    }
}

private extension UploadViewController {
    func setupNavigationItem() {
        navigationItem.title = "New post"
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            title: "Cancel",
            style: .plain,
            target: self,
            action: #selector(didTapLeftButton)
        )
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Share",
            style: .plain,
            target: self,
            action: #selector(didTapRightButton)
        )
    }
    
    @objc func didTapLeftButton() {
        dismiss(animated: true)
    }
    
    @objc func didTapRightButton() {
        // TODO: save
        dismiss(animated: true)
    }
    
    func setupLayout() {
        [imageView, textView].forEach { view.addSubview($0) }
        
        let imageViewInset: CGFloat = 16.0
        
        imageView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(imageViewInset)
            $0.leading.equalToSuperview().inset(imageViewInset)
            $0.width.equalTo(100.0)
            $0.height.equalTo(imageView.snp.width)
        }
        
        textView.snp.makeConstraints {
            $0.leading.equalTo(imageView.snp.trailing).offset(imageViewInset)
            $0.trailing.equalToSuperview().inset(imageViewInset)
            $0.top.equalTo(imageView.snp.top)
            $0.bottom.equalTo(imageView.snp.bottom)
        }
    }
}
