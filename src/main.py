#!/usr/bin/python3

import argparse
import yaml

parser = argparse.ArgumentParser(description="Modify the second IP address in a Traefik YAML configuration file")
parser.add_argument("input_file", help="Path to the input Traefik YAML configuration file")
parser.add_argument("middleware_name", help="Name of the middleware to update")
parser.add_argument("new_ip", help="New IP address to set as the second IP address")

args = parser.parse_args()

with open(args.input_file, 'r') as f:
    config_data = yaml.load(f, Loader=yaml.FullLoader)

if config_data['http']['middlewares'][args.middleware_name]['ipWhiteList']['sourceRange'][1] != args.new_ip:
    config_data['http']['middlewares'][args.middleware_name]['ipWhiteList']['sourceRange'][1] = args.new_ip

    with open(args.input_file, 'w') as f:
        yaml.dump(config_data, f, default_flow_style=False)
