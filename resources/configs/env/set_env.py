import os
import yaml

CONFIG_FILE = os.path.join(os.path.dirname(__file__), "env.yaml")

def get_value(env, key):
    """ ดึงค่าจาก env.yaml ตาม ENV ที่กำหนด """
    with open(CONFIG_FILE, "r") as file:
        config = yaml.safe_load(file)

    if "environments" not in config or env not in config["environments"]:
        raise ValueError(f"⚠️ Unknown environment: {env}")

    return config["environments"][env].get(key, f"⚠️ {key} not found in {env}")

if __name__ == "__main__":
    env = os.getenv("ENV", "dev")
    print(f"✅ Loaded environment: {env}")
