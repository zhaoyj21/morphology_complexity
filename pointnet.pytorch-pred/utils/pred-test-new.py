from __future__ import print_function
import argparse
import os
import random
import torch
import torch.nn.parallel
import torch.optim as optim
import torch.utils.data
import sys
sys.path.append("../")
#from pointnet.dataset import ShapeNetDataset, ModelNetDataset
from pointnet.dataset import ModelNetDataset
from pointnet.model import PointNetCls, feature_transform_regularizer
import torch.nn.functional as F
from tqdm import tqdm
import numpy as np

num_classes = 2
classifier = PointNetCls(k=num_classes, feature_transform=False)
classifier.load_state_dict(torch.load('/data/home/zhaoyj/pointnet.pytorch-pred/utils/parameter.pkl'))
classifier.cuda()

datapath = "/data/home/zhaoyj/pointnet.pytorch-pred/owndata/"
test_dataset = ModelNetDataset(
        root=datapath,
        split='test',
        npoints=2500,
        data_augmentation=False)
        
testdataloader = torch.utils.data.DataLoader(
        test_dataset,
        batch_size=32,
        shuffle=False,
        num_workers=4)
        
for i, data in enumerate(testdataloader, 0):
        points, target = data
        target = target[:, 0]
        points = points.transpose(2, 1)
        points, target = points.cuda(), target.cuda()
        classifier = classifier.eval()
        pred, _, _ = classifier(points)
        print(pred)
        pred_choice = pred.data.max(1)[1]
        print(pred_choice)
        
