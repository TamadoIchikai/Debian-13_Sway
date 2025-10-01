BLUE='\033[0;34m'
GREEN='\033[0;32m'
NC='\033[0m' 

echo -e "${BLUE}-------> install autotiling-rs ${NC}"
cd Downloads/Systems
git clone https://github.com/ammgws/autotiling-rs.git
cd autotiling-rs
cargo build --release
sudo cp target/release/autotiling-rs /usr/local/bin/
echo -e "${GREEN}-------> DONE${NC}"

