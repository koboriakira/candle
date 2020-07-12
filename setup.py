from setuptools import setup, find_packages

setup(
    name="candle",
    version='1.0',
    description='Kindleの蔵書一覧を取得します',
    author='Kobori Akira',
    author_email='private.beats@gmail.com',
    url='https://github.com/koboriakira/candle',
    packages=find_packages(),
    install_requires=open('requirements.txt').read().splitlines(),
)
