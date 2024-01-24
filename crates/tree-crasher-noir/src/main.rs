use anyhow::Result;

fn main() -> Result<()> {
    tree_crasher::main(
        tree_sitter_noir::language(),
        tree_sitter_noir::NODE_TYPES,
    )
}
