#!/usr/bin/env python3
"""
Script to send Discord notification via webhook
"""
import os
import sys
import json
import urllib.request
import urllib.error
from datetime import datetime

def send_discord_notification():
    webhook_url = os.environ.get('DISCORD_WEBHOOK_URL')

    if not webhook_url:
        print("Warning: DISCORD_WEBHOOK_URL not set, skipping Discord notification", file=sys.stderr)
        return

    version_name = os.environ.get('VERSION_NAME', 'unknown')
    build_number = os.environ.get('BUILD_NUMBER', 'unknown')
    custom_message = os.environ.get('CUSTOM_MESSAGE', '')
    build_status = os.environ.get('BUILD_STATUS', 'unknown')
    workflow_url = os.environ.get('WORKFLOW_URL', '')
    triggered_by = os.environ.get('TRIGGERED_BY', 'unknown')
    commit_sha = os.environ.get('COMMIT_SHA', 'unknown')

    # Determine color based on status
    color_map = {
        'success': 0x00FF00,  # Green
        'failure': 0xFF0000,  # Red
        'cancelled': 0xFFA500  # Orange
    }
    color = color_map.get(build_status.lower(), 0x0099FF)  # Default blue

    # Create embed
    embed = {
        'title': f'LoliSnatcher Build #{build_number}',
        'description': custom_message if custom_message else 'Manual build triggered',
        'color': color,
        'fields': [
            {
                'name': 'Version',
                'value': f'{version_name}+{build_number}',
                'inline': True
            },
            {
                'name': 'Status',
                'value': build_status.capitalize(),
                'inline': True
            },
            {
                'name': 'Triggered By',
                'value': triggered_by,
                'inline': True
            },
            {
                'name': 'Commit',
                'value': commit_sha[:7],
                'inline': True
            }
        ],
        'timestamp': datetime.utcnow().isoformat(),
        'footer': {
            'text': 'LoliSnatcher Build System'
        }
    }

    # Add workflow URL if available
    if workflow_url:
        embed['url'] = workflow_url

    # Create the payload
    payload = {
        'embeds': [embed]
    }

    # Send the webhook
    try:
        data = json.dumps(payload).encode('utf-8')
        req = urllib.request.Request(
            webhook_url,
            data=data,
            headers={'Content-Type': 'application/json'}
        )

        with urllib.request.urlopen(req) as response:
            if response.status == 204:
                print("Discord notification sent successfully")
            else:
                print(f"Discord notification sent with status: {response.status}")

    except urllib.error.HTTPError as e:
        print(f"Error sending Discord notification: {e.code} - {e.reason}", file=sys.stderr)
        print(f"Response: {e.read().decode('utf-8')}", file=sys.stderr)
    except Exception as e:
        print(f"Error sending Discord notification: {e}", file=sys.stderr)

if __name__ == '__main__':
    send_discord_notification()
