#[starknet::contract]
mod Counter {
    use traits::Into;

    #[storage]
    struct Storage {
        value: u128,
    }

    #[constructor]
    fn constructor(ref self: ContractState) {}

    #[external(v0)]
    fn increase_counter(ref self: ContractState) {
        self.value.write(self.value.read() + 1 );
    }

    #[abi(embed_v0)]
    fn decrease_counter(ref self: ContractState) {
        self.value.write(self.value.read() - 1 );
    }

    #[abi(embed_v0)]
    fn get_count(self: @ContractState) -> u128 {
        self.value.read()
    }
}