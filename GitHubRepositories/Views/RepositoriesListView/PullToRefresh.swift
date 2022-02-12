//
//  PullToRefresh.swift
//  GitHubRepositories
//
//  Created by Dmitry Kononchuk on 12.02.2022.
//

import SwiftUI

struct PullToRefresh: UIViewRepresentable {
    // MARK: - Property Wrappers
    @Binding var isShowing: Bool
    
    // MARK: - Public Properties
    let onRefresh: () -> Void
    
    // MARK: - Public Methods
    func makeUIView(context: Context) -> UIView {
        let view = UIView(frame: .zero)
        view.isHidden = true
        view.isUserInteractionEnabled = false
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        guard let viewHost = uiView.superview?.superview else { return }
        guard let tableView = tableView(root: viewHost) else { return }
        
        if let refreshControl = tableView.refreshControl {
            if isShowing {
                DispatchQueue.main.async {
                    refreshControl.beginRefreshing()
                }
            } else {
                DispatchQueue.main.async {
                    refreshControl.endRefreshing()
                }
            }
            
            return
        }
        
        let refreshControl = UIRefreshControl()
        refreshControl.tintColor = .white
        refreshControl.addTarget(
            context.coordinator,
            action: #selector(Coordinator.handleRefreshControl),
            for: .valueChanged
        )
        
        tableView.refreshControl = refreshControl
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(isShowing: $isShowing, onRefresh: onRefresh)
    }
    
    // MARK: - Private Methods
    private func tableView(root: UIView) -> UITableView? {
        for subview in root.subviews {
            if let tableView = subview as? UITableView {
                return tableView
            } else if let tableView = tableView(root: subview) {
                return tableView
            }
        }
        
        return nil
    }
}

// MARK: - Ext. Coordinator
extension PullToRefresh {
    class Coordinator {
        // MARK: - Property Wrappers
        let isShowing: Binding<Bool>
        
        // MARK: - Public Properties
        let onRefresh: () -> Void
        
        // MARK: - Initializers
        init(isShowing: Binding<Bool>, onRefresh: @escaping () -> Void) {
            self.isShowing = isShowing
            self.onRefresh = onRefresh
        }
        
        // MARK: - Public Methods
        @objc func handleRefreshControl() {
            isShowing.wrappedValue = true
            onRefresh()
        }
    }
}

// MARK: - Ext. View
extension View {
    func pullToRefresh(isShowing: Binding<Bool>, onRefresh: @escaping () -> Void) -> some View {
        overlay(
            PullToRefresh(isShowing: isShowing, onRefresh: onRefresh)
                .frame(width: 0, height: 0)
        )
    }
}

